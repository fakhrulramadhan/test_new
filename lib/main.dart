import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_news/bloc/auth_bloc/auth_bloc.dart';
import 'package:test_news/data/repository/login_repository.dart';
import 'package:test_news/ui/login/login_screen.dart';
import './ui/news/news_view.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    // Handle event logging or analytics here
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Handle state change logging or analytics here
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    // Handle error logging or analytics here
  }
}

void main() {
  // Initialize the BlocObserver
  Bloc.observer = MyBlocObserver();

  final loginRepository = LoginRepository();

  runApp(BlocProvider<AuthBloc>(
    create: (context) {
      return AuthBloc(loginRepository: loginRepository)..add(AppStarted());
    },
    child: MyApp(loginRepository: loginRepository),
  ));
}

class MyApp extends StatelessWidget {
  final LoginRepository loginRepository;
  const MyApp({
    super.key,
    required this.loginRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('id', 'ID'),
      //blocbuilder dipakai utk menampilkan ui sesuai kondisi statenya
      //(jumlah statenya boleh banyak)
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return const NewsScreen();
          }
          if (state is AuthUnauthenticated) {
            return LoginScreen(loginRepository: loginRepository);
          }
          if (state is AuthLoading) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.0,
                      width: 30,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        strokeWidth: 4,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                    width: 30,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      strokeWidth: 4,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
