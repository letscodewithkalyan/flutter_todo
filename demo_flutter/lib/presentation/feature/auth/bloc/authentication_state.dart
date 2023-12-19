part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class Uninitialized extends AuthenticationState {}

final class Authenticated extends AuthenticationState {}

final class UnAuthenticated extends AuthenticationState {}

class LoadingState extends AuthenticationState {}
