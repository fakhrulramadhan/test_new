import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repository/login_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepository loginRepository;

  AuthBloc({required this.loginRepository}) : super(AuthUnitialized()) {
    //ketika eventnya baru appstarted
    on<AppStarted>((event, emit) async {
      final bool hasToken = await loginRepository.hasToken();
      if (hasToken) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthLoading());
      await loginRepository.persistToken(event.token);
      emit(AuthAuthenticated());
    });

    on<LoggedOut>((event, emit) async {
      emit(AuthLoading());
      await loginRepository.deleteToken();
      emit(AuthUnauthenticated());
    });
  }
}
