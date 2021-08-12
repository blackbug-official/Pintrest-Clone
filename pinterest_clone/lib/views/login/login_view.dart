library login_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/theme/colors.dart';
import 'package:pinterest_clone/views/home/home_view.dart';
import 'package:pinterest_clone/widgets/dumb_widgets/terms_and_condition.dart';
import 'package:pinterest_clone/widgets/smart_widgets/email_text_input.dart';
import 'package:pinterest_clone/widgets/smart_widgets/login_button.dart';
import 'package:pinterest_clone/widgets/smart_widgets/password_text_input.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'login_view_model.dart';

part 'login_mobile.dart';
part 'login_tablet.dart';
part 'login_desktop.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (BuildContext context, LoginViewModel viewModel, Widget child) {
        return ScreenTypeLayout(
          mobile: _LoginMobile(viewModel),
          desktop: _LoginDesktop(viewModel),
          tablet: _LoginTablet(viewModel),  
        );
      }
    );
  }
}
