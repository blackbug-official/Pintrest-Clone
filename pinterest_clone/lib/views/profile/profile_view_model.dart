import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:pinterest_clone/enums.dart';
import '../add_pin/add_pin_view.dart';
import 'package:stacked/stacked.dart';
import '../../core/logger.dart';

class ProfileViewModel extends BaseViewModel {
  Logger log;

  ProfileViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  navigateToAddPin(
      BuildContext context, UserCredential userCredential, AuthType authType) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => AddPinView(
          userCredential: userCredential,
          authtype: authType,
        ),
      ),
    );
  }
}
