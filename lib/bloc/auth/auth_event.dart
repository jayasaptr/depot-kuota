part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthRegisterEvent extends AuthEvent {
  final String nama;
  final String email;
  final String hp;
  final String referallcode;

  const AuthRegisterEvent({
    required this.nama,
    required this.email,
    required this.hp,
    required this.referallcode,
  });

  @override
  List<Object> get props => [nama, email, hp, referallcode];
}

class AuthFailedEvent extends AuthEvent {
  final String message;

  const AuthFailedEvent({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthValidEvent extends AuthEvent {
  final String message;

  const AuthValidEvent({required this.message});

  @override
  List<Object> get props => [message];
}


