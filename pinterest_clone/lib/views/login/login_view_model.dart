import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:pinterest_clone/widgets/dumb_widgets/loader.dart';
import '../../enums.dart';
import '../home/home_view.dart';
import 'package:stacked/stacked.dart';
import '../../core/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends BaseViewModel {
  Logger log;
  UserCredential _userCredential;

  LoginViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithAuth(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    return null;
  }

  navigateToNextScreenUsingGoogle(BuildContext context) async {
    showLoaderDialog(context, 'Logging in...');
    _userCredential = await signInWithGoogle();
    if (_userCredential != null) {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => HomeView(
              userCredential: _userCredential,
              authType: AuthType.GOOGLE_AUTH,
            ),
          ),
          (route) => false);
    }
  }

  navigateToNextScreenUsingAuth(
      BuildContext context, String email, String password) async {
    if (email == null || email.isEmpty || password == null || password.isEmpty)
      return;
    showLoaderDialog(context, 'Logging in...');
    _userCredential = await signInWithAuth(email, password);
    if (_userCredential != null) {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => HomeView(
              userCredential: _userCredential,
              authType: AuthType.EMAIL_AUTH,
            ),
          ),
          (route) => false);
    }
  }
}
