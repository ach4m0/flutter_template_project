part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable{

  @override
  List<Object> get props => [];

}

class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {}
