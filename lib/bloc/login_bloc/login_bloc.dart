import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_news/data/repository/login_repository.dart';
import '../auth_bloc/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final AuthBloc authBloc;

  LoginBloc({required this.loginRepository, required this.authBloc})
      : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading()); //merubah UI dengan emit
      try {
        final token = await loginRepository.login(event.email, event.password);
        authBloc.add(LoggedIn(token: token));
        emit(LoginInitial());
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
