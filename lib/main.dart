import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_template_project/locator.dart';
import 'package:flutter_template_project/router.dart';
import 'package:flutter_template_project/core/blocs/simple_bloc_delegate.dart';
import 'package:flutter_template_project/core/blocs/login/login_bloc.dart';
import 'package:flutter_template_project/core/blocs/auth/auth_bloc.dart';
import 'package:flutter_template_project/ui/shared/theme.dart';
import 'package:flutter_template_project/ui/home/home.dart';
import 'package:flutter_template_project/ui/login/login.dart';
import 'package:flutter_template_project/ui/splash/splash.dart';

void main() {
  setupLocator();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()..add(AppStarted())),
        BlocProvider(create: (_) => LoginBloc()),
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      initialRoute: initialRoute,
      onGenerateRoute: generateRoute,
      title: 'App',
      theme: themeData,
    );
  }
}
