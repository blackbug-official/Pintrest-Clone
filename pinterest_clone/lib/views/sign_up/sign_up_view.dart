library sign_up_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/theme/colors.dart';
import 'package:pinterest_clone/views/home/home_view.dart';
import 'package:pinterest_clone/widgets/dumb_widgets/terms_and_condition.dart';
import 'package:pinterest_clone/widgets/smart_widgets/confirm_password_text_input.dart';
import 'package:pinterest_clone/widgets/smart_widgets/email_text_input.dart';
import 'package:pinterest_clone/widgets/smart_widgets/login_button.dart';
import 'package:pinterest_clone/widgets/smart_widgets/password_text_input.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'sign_up_view_model.dart';

part 'sign_up_mobile.dart';
part 'sign_up_tablet.dart';
part 'sign_up_desktop.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder:
            (BuildContext context, SignUpViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _SignUpMobile(viewModel),
            desktop: _SignUpDesktop(viewModel),
            tablet: _SignUpTablet(viewModel),
          );
        });
  }
}
