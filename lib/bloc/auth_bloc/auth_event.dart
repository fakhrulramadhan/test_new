part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

//ada dua event disini (app started dan loggedin)

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final String token;

  const LoggedIn({required this.token});

  //utk melempar nilai
  @override
  List<Object> get props => [token];

  //konvert ke string
  @override
  String toString() => "LoggedIn { token: $token}";
}

class LoggedOut extends AuthEvent {}
