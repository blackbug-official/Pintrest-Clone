// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:pinterest_clone/core/router_constants.dart';
import 'package:pinterest_clone/views/add_pin/add_pin_view.dart' as view4;
import 'package:pinterest_clone/views/detail/detail_view.dart' as view2;
import 'package:pinterest_clone/views/home/home_view.dart' as view1;
import 'package:pinterest_clone/views/login/login_view.dart' as view0;
import 'package:pinterest_clone/views/profile/profile_view.dart' as view3;
import 'package:pinterest_clone/views/sign_up/sign_up_view.dart' as view6;
import 'package:pinterest_clone/views/start_up/start_up_view.dart' as view5;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginViewRoute:
        return MaterialPageRoute(builder: (_) => view0.LoginView());
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => view1.HomeView());
      case detailViewRoute:
        return MaterialPageRoute(builder: (_) => view2.DetailView());
      case profileViewRoute:
        return MaterialPageRoute(builder: (_) => view3.ProfileView());
      case addPinViewRoute:
        return MaterialPageRoute(builder: (_) => view4.AddPinView());
      case startUpViewRoute:
        return MaterialPageRoute(builder: (_) => view5.StartUpView());
      case signUpViewRoute:
        return MaterialPageRoute(builder: (_) => view6.SignUpView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
