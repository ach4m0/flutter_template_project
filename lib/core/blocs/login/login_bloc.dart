import 'dart:async';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_template_project/core/services/firebase_auth_service.dart';
import 'package:flutter_template_project/locator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  FirebaseAuthService _authService = locator<FirebaseAuthService>();

  @override
  LoginState get initialState => LoginLoading();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    if(event is LoginWithGoogle) {
      yield* _mapLoginWithGoogleToState();

    }else if(event is LoginWithCredentials) {
      yield* _mapLoginWithCredentialsToState(
        email: event.email,
        password: event.password
      );

    }
  }

    Stream<LoginState> _mapLoginWithGoogleToState() async* {
    yield LoginLoading();

    try {
      await _authService.signInWithGoogle();

      yield LoginSuccess();

    }catch(_) {
      yield LoginError();
    }

  }

  Stream<LoginState> _mapLoginWithCredentialsToState({String email, String password}) async* {
    yield LoginLoading();

    try {
      await _authService.signInWithCredentials(email, password);

      yield LoginSuccess();

    }catch(_) {
      yield LoginError();
    }

  }

}
