library detail_view;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinterest_clone/core/models/image_model.dart';
import 'package:pinterest_clone/enums.dart';
import 'package:pinterest_clone/theme/colors.dart';
import 'package:pinterest_clone/widgets/smart_widgets/detail_view_button.dart';
import 'package:pinterest_clone/widgets/smart_widgets/navbar.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'detail_view_model.dart';

part 'detail_mobile.dart';
part 'detail_tablet.dart';
part 'detail_desktop.dart';

class DetailView extends StatelessWidget {
  final ImageData imageData;
  final UserCredential userCredential;
  final AuthType authType;

  const DetailView(
      {Key key, this.imageData, this.userCredential, this.authType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
        viewModelBuilder: () => DetailViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder:
            (BuildContext context, DetailViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _DetailMobile(viewModel, imageData),
            desktop:
                _DetailDesktop(viewModel, imageData, userCredential, authType),
            tablet:
                _DetailTablet(viewModel, imageData, userCredential, authType),
          );
        });
  }
}
