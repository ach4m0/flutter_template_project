import 'package:flutter/material.dart';

import 'package:flutter_template_project/ui/splash/splash.dart';
import 'package:flutter_template_project/ui/login/login.dart';
import 'package:flutter_template_project/ui/home/home.dart';

const String initialRoute = SplashPage.routeName;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {

    case SplashPage.routeName:
      return MaterialPageRoute(builder: (_) => SplashPage());

    case LoginPage.routeName:
      return MaterialPageRoute(builder: (_) => LoginPage());

    case HomePage.routeName:
      return MaterialPageRoute(builder: (_) => HomePage());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        )
      );
  }
}
