// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Meta meta;
  Data data;

  LoginModel({
    required this.meta,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        meta: Meta.fromJson(json["meta"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String hp;
  String email;

  Data({
    required this.id,
    required this.hp,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        hp: json["hp"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hp": hp,
        "email": email,
      };
}

class Meta {
  int code;
  String message;

  Meta({
    required this.code,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
