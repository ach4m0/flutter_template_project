import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_template_project/core/blocs/auth/auth_bloc.dart';
import 'package:flutter_template_project/ui/login/login.dart';

class HomePage extends StatelessWidget {

  static const String routeName = '/home';

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white,),
            itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text('Cerrar sesión'),
                ),
              ],
              onSelected: (_) {
                BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
              },
          )
        ],
      ),
    );
  }
}
