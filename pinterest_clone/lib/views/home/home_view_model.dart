import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:pinterest_clone/core/models/image_model.dart';
import 'package:pinterest_clone/enums.dart';
import 'package:pinterest_clone/views/add_pin/add_pin_view.dart';
import 'package:pinterest_clone/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import '../../core/logger.dart';
import 'home_view.dart';

class HomeViewModel extends BaseViewModel {
  Logger log;

  List<ImageData> pinList = [];

  HomeViewModel() {
    this.log = getLogger(this.runtimeType.toString());
    getPinsFromFirebase();
  }

  ScrollController _controller = ScrollController();
  get getController => _controller;

  double _yOffset = 0.0;
  get getYOffset => _yOffset;

  void setYOffsetOnScrollUp() {
    _yOffset = 200.0;
    notifyListeners();
  }

  void setYOffsetOnScrollDown() {
    _yOffset = 0.0;
    notifyListeners();
  }

  getPinsFromFirebase() async {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection('pins').get().then((querySnapshot) {
      pinList.clear();
      querySnapshot.docs.forEach((result) {
        pinList
            .add(ImageData(id: result.id, imageUrl: result.data()['imageURL']));
      });
      notifyListeners();
    });
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

  navigateToProfile(
      BuildContext context, UserCredential userCredential, AuthType authType) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ProfileView(
          authType: authType,
          userCredential: userCredential,
        ),
      ),
    );
  }

  navigateToHome(
      BuildContext context, UserCredential userCredential, AuthType authType) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => HomeView(
          authType: authType,
          userCredential: userCredential,
        ),
      ),
    );
  }
}
