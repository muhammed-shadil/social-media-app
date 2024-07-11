part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class Loginevent extends LoginEvent {
  final String email;
  final String password;

  Loginevent(this.email, this.password);
}

class Signupevent extends LoginEvent {
  final Usermodel user;

  Signupevent({required this.user});
}
