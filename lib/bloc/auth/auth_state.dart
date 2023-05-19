part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {
  final ValidasiRegister validasiRegister;

  const AuthRegisterSuccess({required this.validasiRegister});

  @override
  List<Object> get props => [validasiRegister];
}

class AuthRegisterFailed extends AuthState {
  final String message;

  const AuthRegisterFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthValid extends AuthState {
  final String message;

  const AuthValid({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthChangeState extends AuthState {
  final bool isTrue;

  const AuthChangeState({required this.isTrue});

  @override
  List<Object> get props => [isTrue];
}
