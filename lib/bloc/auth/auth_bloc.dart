import 'package:bloc/bloc.dart';
import 'package:depotkuota/model/auth/login_success_model.dart';
import 'package:depotkuota/model/auth/register_failed_model.dart';
import 'package:depotkuota/model/auth/register_success_model.dart';
import 'package:depotkuota/repositories/auth/auth_rerpository.dart';
import 'package:equatable/equatable.dart';

import '../../model/auth/login_model.dart';
import '../../model/auth/validasi_register_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepostiroy _repository;
  AuthBloc(this._repository) : super(AuthInitial()) {
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        ValidasiRegister validasi = await _repository.register(
          nama: event.nama,
          email: event.email,
          hp: event.hp,
          referallcode: event.referallcode,
        );
        emit(AuthRegisterSuccess(validasiRegister: validasi));
      } catch (e) {
        RegisterFailedModel failed = e as RegisterFailedModel;
        emit(AuthRegisterFailed(message: failed.meta.message));
      }
    });

    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        LoginModel login = await _repository.login(hp: event.hp);
        emit(AuthLoginSuccess(loginModel: login));
      } catch (e) {
        RegisterFailedModel failed = e as RegisterFailedModel;
        emit(AuthRegisterFailed(message: failed.meta.message));
      }
    });

    on<AuthRegisterOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        RegisterSuccessModel login = await _repository.registerOtp(
          email: event.email,
          hp: event.hp,
          kode: event.kode,
          nama: event.nama,
        );
        emit(AuthRegisterOtpSuccess(loginModel: login));
      } catch (e) {
        RegisterFailedModel failed = e as RegisterFailedModel;
        emit(AuthRegisterFailed(message: failed.meta.message));
      }
    });

    on<AuthLoginOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        LoginSuccessModel login =
            await _repository.loginOtp(hp: event.hp, otp: event.otp);
        emit(AuthLoginOtpSuccess(loginModel: login));
      } catch (e) {
        RegisterFailedModel failed = e as RegisterFailedModel;
        emit(AuthRegisterFailed(message: failed.meta.message));
      }
    });

    on<AuthFailedEvent>(
      (event, emit) {
        emit(AuthRegisterFailed(message: event.message));
      },
    );
    on<AuthValidEvent>(
      (event, emit) {
        emit(AuthValid(message: event.message));
      },
    );

    on<GetOtpEvent>(
      (event, emit) {
        emit(GetOtpSuccess(otp: event.otp));
      },
    );
  }
}
