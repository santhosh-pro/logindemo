
import 'package:logindemo/business_logic/models/login/login_response.dart';

abstract class LoginState {}

class LoginStateDefault extends LoginState {
  @override
  String toString() => 'LoginStateDefault';
}

class LoginStateLoading extends LoginState {
  @override
  String toString() => 'LoginStateLoading';
}

class LoginStateError extends LoginState {
  final String message;

  LoginStateError({this.message});

  @override
  String toString() => 'LoginStateError';
}

class LoginStateLoaded extends LoginState {
  final LoginResponse data;

  LoginStateLoaded({this.data});

  @override
  String toString() => 'LoginStateLoaded';
}