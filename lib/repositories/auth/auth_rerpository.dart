import 'dart:convert';

import 'package:depotkuota/common/shared_code.dart';
import 'package:depotkuota/model/auth/login_model.dart';
import 'package:depotkuota/model/auth/login_success_model.dart';
import 'package:depotkuota/model/auth/register_failed_model.dart';
import 'package:depotkuota/model/auth/register_success_model.dart';
import 'package:depotkuota/model/auth/validasi_register_model.dart';
import 'package:depotkuota/repositories/auth/base_auth_repository.dart';
import 'package:http/http.dart' as http;

class AuthRepostiroy implements BaseAuthRepository {
  Future<ValidasiRegister> register({
    String? nama,
    String? email,
    String? hp,
    String? referallcode,
  }) async {
    final response = await http.post(
        Uri.parse(
          "${SharedCode.baseUrl}v1/user/validasi-register",
        ),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          "nama": nama,
          "email": email,
          "hp": hp,
          "referall_code": referallcode,
        });

    if (response.statusCode == 200) {
      return ValidasiRegister.fromJson(jsonDecode(response.body));
    } else {
      throw registerFailedModelFromJson(response.body);
    }
  }

  Future<LoginModel> login({String? hp}) async {
    final response = await http.post(
      Uri.parse("${SharedCode.baseUrl}v1/user/login"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "hp": hp,
      },
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      throw registerFailedModelFromJson(response.body);
    }
  }

  Future<ValidasiRegister> sendOtp({String? hp}) async {
    final response = await http.post(
      Uri.parse("${SharedCode.baseUrl}v1/otp/send"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "hp": hp,
      },
    );

    if (response.statusCode == 200) {
      return ValidasiRegister.fromJson(jsonDecode(response.body));
    } else {
      throw registerFailedModelFromJson(response.body);
    }
  }

  Future<LoginSuccessModel> loginOtp({String? hp, String? otp}) async {
    final response = await http.post(
      Uri.parse("${SharedCode.baseUrl}v1/otp/validate-login"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "hp": hp,
        "kode": otp,
      },
    );

    if (response.statusCode == 200) {
      return LoginSuccessModel.fromJson(jsonDecode(response.body));
    } else {
      throw registerFailedModelFromJson(response.body);
    }
  }

  Future<RegisterSuccessModel> registerOtp({
    String? nama,
    String? email,
    String? hp,
    String? kode,
  }) async {
    final response = await http.post(
      Uri.parse("${SharedCode.baseUrl}v1/otp/validate-register"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "nama": nama,
        "email": email,
        "hp": hp,
        "kode": kode,
      },
    );

    if (response.statusCode == 200) {
      return RegisterSuccessModel.fromJson(jsonDecode(response.body));
    } else {
      throw registerFailedModelFromJson(response.body);
    }
  }
}
