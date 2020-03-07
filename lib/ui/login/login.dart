import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_template_project/core/blocs/login/login_bloc.dart';
import 'package:flutter_template_project/core/blocs/auth/auth_bloc.dart';
import 'package:flutter_template_project/ui/widgets/buttons.dart';
import 'package:flutter_template_project/ui/widgets/text_fields.dart';

class LoginPage extends StatefulWidget {

  static const String routeName = '/login';

  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoadingCredentials = false;
  bool isLoadingGoogleSignIn = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocListener<LoginBloc,LoginState>(
            listener: (context, state) {
              if(state is LoginLoading) {
                _showSnackBar(context: context, text: 'Iniciando sesión');
              }

              if(state is LoginError) {
                _showSnackBar(context: context, text: 'Error al iniciar sesión', error: true);
                _stopLoading();
              }

              if(state is LoginSuccess) {
                BlocProvider.of<AuthBloc>(context).add(LoggedIn());
                _stopLoading();
              }
            },
            child: _getLoginForm()
          )
        ),
      ),
    );
  }

  void _showSnackBar({BuildContext context, String text, bool error = false}) {
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: error ? Theme.of(context).errorColor : Theme.of(context).primaryColor,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: TextStyle(color: Colors.white),),
                error ?
                  Icon(Icons.error) :
                  SizedBox()
              ]
            ),
        )
      );
  }

  _stopLoading() {
    setState(() {
      isLoadingCredentials = false;
      isLoadingGoogleSignIn = false;
    });
  }

  Widget _getLogo() =>
    Center(
      child: Image(
        image: AssetImage('assets/images/logo.png'),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.4,
      ),
    );

  Widget _getLoginForm() =>
    ListView(
      children: <Widget>[
        _getLogo(),
        SizedBox(height: 16,),
        Text(
          'Iniciar sesión',
          style: Theme.of(context).textTheme.headline4.copyWith(
            color: Theme.of(context).primaryColor
          ),
        ),
        SizedBox(height: 16,),
        CustomTextField(
          labelText: 'Correo electrónico',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16,),
        CustomTextField(
          labelText: 'Password',
          controller: _passwordController,
          obscureText: true,
        ),
        SizedBox(height: 16,),
        Container(
          height: 50,
          width: double.infinity,
          child: PrimaryButton(
            child:
              isLoadingCredentials ?
                CircularProgressIndicator() :
                Text(
                  'INICIAR SESIÓN',
                  style: Theme.of(context).textTheme.button.copyWith(
                    color: Colors.white,
                  )
              ),
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(
                LoginWithCredentials(
                  email: _emailController.text,
                  password: _passwordController.text
                )
              );
              setState(() {
                isLoadingCredentials = true;
              });
            },
          )
        ),
        SizedBox(height: 16,),
        Divider(thickness: 2,),
        SizedBox(height: 16,),
        Container(
          height: 50,
          width: double.infinity,
          child: CustomOutlineButton(
            child: isLoadingGoogleSignIn ?
              CircularProgressIndicator() :
              Text(
                'INICIAR SESIÓN CON GOOGLE',
                style: Theme.of(context).textTheme.button.copyWith(
                  color: Theme.of(context).primaryColor,
                )
              ),
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(LoginWithGoogle());
              setState(() {
                isLoadingGoogleSignIn = true;
              });
            },
          ),
        )
      ],
    );

}
