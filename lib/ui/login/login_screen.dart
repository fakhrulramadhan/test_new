import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/bloc/auth_bloc/auth_bloc.dart';
import 'package:test_news/bloc/login_bloc/login_bloc.dart';
import 'package:test_news/ui/login/login_form.dart';

import '../../data/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final LoginRepository loginRepository;
  const LoginScreen({super.key, required this.loginRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              loginRepository: loginRepository,
              authBloc: BlocProvider.of<AuthBloc>(context));
        },
        child: LoginForm(loginRepository: loginRepository),
      ),
    );
  }
}
