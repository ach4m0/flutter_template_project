import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_template_project/locator.dart';
import 'package:flutter_template_project/core/services/firebase_auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  FirebaseAuthService _authService = locator<FirebaseAuthService>();

  @override
  AuthState get initialState => Uninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event,) async* {
    if(event is AppStarted) {
      yield* _mapAppStartedToState();

    }else if(event is LoggedIn) {
      yield* _mapLoggedInToState();

    }else if(event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      await Future.delayed(Duration(seconds: 1));
      final isSignedIn = await _authService.isSignedIn();

      if(isSignedIn) {
        final name = await _authService.getUser();
        yield Authenticated(name);
      }else{
        yield Unauthenticated();
      }

    } catch(_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthState> _mapLoggedInToState() async* {
    yield Authenticated(await _authService.getUser());
  }

  Stream<AuthState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _authService.signOut();
  }

}
