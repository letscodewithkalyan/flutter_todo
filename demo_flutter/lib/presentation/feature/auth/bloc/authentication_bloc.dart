import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(Uninitialized()) {
    on<LoggedIn>(OnLoggedIn);
    on<LoggedOut>(OnLoggedOut);
  }

  Future<void> OnLoggedIn(
      LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(LoadingState());
    if (event.email.isNotEmpty && event.password.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      emit(Authenticated());
    } else {
      emit(Uninitialized());
    }
  }

  Future<void> OnLoggedOut(
      LoggedOut event, Emitter<AuthenticationState> emit) async {}
}
