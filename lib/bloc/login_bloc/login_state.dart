part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

//ada 3 turunan state disini
class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error; //utk sbg pesan error

  const LoginFailure({required this.error});

  //utk lempar data
  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error}';
}
