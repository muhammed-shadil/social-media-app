part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class loadingstate extends LoginState {}

final class LoginInitial extends LoginState {}

final class loginsuccess extends LoginState {
  final String message;

  loginsuccess({required this.message});
}

final class loginerror extends LoginState {
  final String message;

  loginerror({required this.message});
}

final class Signupsuccess extends LoginState {
  final String message;

  Signupsuccess({required this.message});
}

final class Signuperror extends LoginState {
  final String message;

  Signuperror({required this.message});
}

final class authenticated extends LoginState {}

final class unauthenticated extends LoginState {}

final class AuthenticatedErrorState extends LoginState {
  final String message;

  AuthenticatedErrorState({required this.message});
}
