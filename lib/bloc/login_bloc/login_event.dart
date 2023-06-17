part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

//buat event ketika button dipencet
class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  //menimpa fungsi tostring (menggantinya dengan nilai baru)
  @override
  String toString() =>
      'Login Button Presed { email: $email, password: $password}';
}
