// To parse this JSON data, do
//
//     final loginSuccessModel = loginSuccessModelFromJson(jsonString);

import 'dart:convert';

LoginSuccessModel loginSuccessModelFromJson(String str) =>
    LoginSuccessModel.fromJson(json.decode(str));

String loginSuccessModelToJson(LoginSuccessModel data) =>
    json.encode(data.toJson());

class LoginSuccessModel {
  Meta? meta;
  Data? data;
  String? token;

  LoginSuccessModel({
    this.meta,
    this.data,
    this.token,
  });

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) =>
      LoginSuccessModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
        "token": token,
      };
}

class Data {
  String? id;
  String? hp;
  String? email;
  String? nama;
  String? imgProfile;
  String? firebaseId;
  String? referallId;
  String? uplineId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Data({
    this.id,
    this.hp,
    this.email,
    this.nama,
    this.imgProfile,
    this.firebaseId,
    this.referallId,
    this.uplineId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        hp: json["hp"],
        email: json["email"],
        nama: json["nama"],
        imgProfile: json["img_profile"],
        firebaseId: json["firebase_id"],
        referallId: json["referall_id"],
        uplineId: json["upline_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hp": hp,
        "email": email,
        "nama": nama,
        "img_profile": imgProfile,
        "firebase_id": firebaseId,
        "referall_id": referallId,
        "upline_id": uplineId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Meta {
  int? code;
  String? message;

  Meta({
    this.code,
    this.message,
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
