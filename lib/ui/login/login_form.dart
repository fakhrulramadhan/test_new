import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/bloc/login_bloc/login_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../data/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final LoginRepository loginRepository;
  const LoginForm({super.key, required this.loginRepository});

  @override
  State<LoginForm> createState() => _LoginFormState(loginRepository);
}

class _LoginFormState extends State<LoginForm> {
  _LoginFormState(LoginRepository loginRepository);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      //loginbloc bawa sebagai providernya
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
          email: _emailController.text, password: _passwordController.text));
    }

    //yang dijadikan event bukan login eventnya tp loginbloc
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Login Gagal."),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.asset("assets/json/uilogin.json"),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 115, 219, 119),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30)),
                      contentPadding:
                          const EdgeInsets.only(left: 10, right: 10),
                      labelText: "E-mail",
                      hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                      labelStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 115, 219, 119),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                        size: 24.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30)),
                      contentPadding:
                          const EdgeInsets.only(left: 10, right: 10),
                      labelText: "Password",
                      hintStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                      labelStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 30, 105, 34)),
                  onPressed: _onLoginButtonPressed,
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
