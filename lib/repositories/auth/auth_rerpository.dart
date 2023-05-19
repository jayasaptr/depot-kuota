import 'dart:convert';

import 'package:depotkuota/common/shared_code.dart';
import 'package:depotkuota/model/auth/register_failed_model.dart';
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
}
