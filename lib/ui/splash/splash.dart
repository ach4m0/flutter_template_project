import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_template_project/locator.dart';
import 'package:flutter_template_project/core/blocs/auth/auth_bloc.dart';
import 'package:flutter_template_project/core/services/navigation_service.dart';
import 'package:flutter_template_project/ui/home/home.dart';
import 'package:flutter_template_project/ui/login/login.dart';

class SplashPage extends StatelessWidget {

  static const String routeName = '/';

  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationService _navigationService = locator<NavigationService>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is Unauthenticated)
          Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
          // _navigationService.navigateTo(LoginPage.routeName, arguments: {});

        if(state is Authenticated)
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          // _navigationService.navigateTo(HomePage.routeName, arguments: {});

      },
      child: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.4,
          )
        ),
      )
    );
  }
}
