library home_view;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone/core/models/image_model.dart';
import 'package:pinterest_clone/enums.dart';
import 'package:pinterest_clone/theme/colors.dart';
import 'package:pinterest_clone/views/add_pin/add_pin_view.dart';
import 'package:pinterest_clone/views/detail/detail_view.dart';
import 'package:pinterest_clone/views/profile/profile_view.dart';
import 'package:pinterest_clone/widgets/dumb_widgets/image_card.dart';
import 'package:pinterest_clone/widgets/smart_widgets/home_view_button.dart';
import 'package:pinterest_clone/widgets/smart_widgets/navbar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

part 'home_desktop.dart';
part 'home_mobile.dart';
part 'home_tablet.dart';

class HomeView extends StatelessWidget {
  final UserCredential userCredential;
  final AuthType authType;

  const HomeView(
      {Key key, @required this.userCredential, @required this.authType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (BuildContext context, HomeViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _HomeMobile(viewModel, userCredential, authType),
            desktop: _HomeDesktop(viewModel, userCredential, authType),
            tablet: _HomeTablet(viewModel, userCredential, authType),
          );
        });
  }
}
