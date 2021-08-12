library add_pin_view;

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:pinterest_clone/enums.dart';
import 'package:pinterest_clone/theme/colors.dart';
import 'package:pinterest_clone/widgets/smart_widgets/detail_view_button.dart';
import 'package:pinterest_clone/widgets/smart_widgets/home_view_button.dart';
import 'package:pinterest_clone/widgets/smart_widgets/navbar.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'add_pin_view_model.dart';

part 'add_pin_mobile.dart';
part 'add_pin_tablet.dart';
part 'add_pin_desktop.dart';

class AddPinView extends StatelessWidget {
  final UserCredential userCredential;
  final AuthType authtype;

  const AddPinView({Key key, this.userCredential, this.authtype})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPinViewModel>.reactive(
        viewModelBuilder: () => AddPinViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder:
            (BuildContext context, AddPinViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _AddPinMobile(viewModel, userCredential, authtype),
            desktop: _AddPinDesktop(viewModel, userCredential, authtype),
            tablet: _AddPinTablet(viewModel, userCredential, authtype),
          );
        });
  }
}
