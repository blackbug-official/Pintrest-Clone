import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:pinterest_clone/enums.dart';
import 'package:pinterest_clone/views/home/home_view.dart';
import 'package:pinterest_clone/widgets/dumb_widgets/loader.dart';
import 'package:stacked/stacked.dart';
import '../../core/logger.dart';

class SignUpViewModel extends BaseViewModel {
  Logger log;
  UserCredential _userCredential;

  SignUpViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  Future<UserCredential> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  navigateToNextScreen(
      BuildContext context, String email, String password) async {
    if (email == null || email.isEmpty || password == null || password.isEmpty)
      return;
    showLoaderDialog(context, 'Signing Up...');
    _userCredential = await registerUser(email, password);
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
}
