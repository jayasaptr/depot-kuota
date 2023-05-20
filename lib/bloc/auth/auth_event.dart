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

class AuthLoginEvent extends AuthEvent {
  final String hp;

  const AuthLoginEvent({required this.hp});

  @override
  List<Object> get props => [hp];
}

class AuthLoginOtpEvent extends AuthEvent {
  final String hp;
  final String otp;

  const AuthLoginOtpEvent({required this.hp, required this.otp});

  @override
  List<Object> get props => [hp, otp];
}

class AuthRegisterOtpEvent extends AuthEvent {
  final String email;
  final String hp;
  final String kode;
  final String nama;

  const AuthRegisterOtpEvent(this.email, this.nama,
      {required this.hp, required this.kode});

  @override
  List<Object> get props => [hp, nama, kode, email];
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

class GetOtpEvent extends AuthEvent {
  final String otp;

  const GetOtpEvent({required this.otp});

  @override
  List<Object> get props => [otp];
}
