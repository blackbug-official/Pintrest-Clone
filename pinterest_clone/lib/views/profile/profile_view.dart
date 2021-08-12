library profile_view;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/widgets/smart_widgets/navbar.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../enums.dart';
import 'profile_view_model.dart';

part 'profile_mobile.dart';
part 'profile_tablet.dart';
part 'profile_desktop.dart';

class ProfileView extends StatelessWidget {
  final UserCredential userCredential;
  final AuthType authType;

  const ProfileView(
      {Key key, @required this.userCredential, @required this.authType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder:
            (BuildContext context, ProfileViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _ProfileMobile(viewModel, userCredential, authType),
            desktop: _ProfileDesktop(viewModel, userCredential, authType),
            tablet: _ProfileTablet(viewModel, userCredential, authType),
          );
        });
  }
}
