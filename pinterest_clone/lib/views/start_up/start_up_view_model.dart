import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:pinterest_clone/views/sign_up/sign_up_view.dart';
import '../login/login_view.dart';
import 'package:stacked/stacked.dart';
import '../../core/logger.dart';

class StartUpViewModel extends BaseViewModel {
  Logger log;

  StartUpViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  navigateToSignIn(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }

  navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => SignUpView(),
      ),
    );
  }
}
