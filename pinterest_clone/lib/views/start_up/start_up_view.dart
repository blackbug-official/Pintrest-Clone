library start_up_view;

import 'package:flutter/material.dart';
import 'package:pinterest_clone/theme/colors.dart';
import 'package:pinterest_clone/widgets/dumb_widgets/terms_and_condition.dart';
import 'package:pinterest_clone/widgets/smart_widgets/login_button.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'start_up_view_model.dart';

part 'start_up_mobile.dart';
part 'start_up_tablet.dart';
part 'start_up_desktop.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
        viewModelBuilder: () => StartUpViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder:
            (BuildContext context, StartUpViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _StartUpMobile(viewModel),
            desktop: _StartUpDesktop(viewModel),
            tablet: _StartUpTablet(viewModel),
          );
        });
  }
}
