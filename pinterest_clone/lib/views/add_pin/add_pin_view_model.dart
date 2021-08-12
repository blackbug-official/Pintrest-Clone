import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:pinterest_clone/enums.dart';
import 'package:pinterest_clone/views/home/home_view.dart';
import 'package:pinterest_clone/widgets/dumb_widgets/loader.dart';
import 'package:stacked/stacked.dart';
import '../../core/logger.dart';

class AddPinViewModel extends BaseViewModel {
  Logger log;

  XFile _imageFile;
  ImagePicker picker = ImagePicker();
  File _imageFromMobile;
  String imageName;

  AddPinViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  bool isImage = false;
  get getImage => _imageFile;
  get getImageForMobile => _imageFromMobile;

  Future<void> pickAnImage() async {
    isImage = true;
    notifyListeners();
  }

  Future pickImageFromMobile() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    _imageFromMobile = File(image.path);
    imageName = image.name;
    isImage = true;
    notifyListeners();
  }

  uploadImage(BuildContext context, UserCredential user, String title,
      String description, AuthType authType) {
    showLoaderDialog(context, 'Uploading pin...');

    FirebaseStorage storage = FirebaseStorage.instance;

    Reference ref = storage.ref().child(imageName);

    UploadTask uploadTask = ref.putFile(_imageFromMobile);

    String url;

    uploadTask.whenComplete(() async {
      url = await ref.getDownloadURL();

      final firestoreInstance = FirebaseFirestore.instance;

      firestoreInstance.collection('pins').doc(imageName).set({
        'author': user.user.displayName,
        'authorId': user.user.uid,
        'description': description,
        'imageURL': url,
        'likes': 0,
        'title': title,
      }).then((_) {
        Navigator.pop(context);
        navigateToProfileView(context, user, authType);
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  navigateToProfileView(
      BuildContext context, UserCredential credential, AuthType authType) {
    Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (context) => HomeView(
            userCredential: credential,
            authType: authType,
          ),
        ),
        (route) => false);
  }
}
