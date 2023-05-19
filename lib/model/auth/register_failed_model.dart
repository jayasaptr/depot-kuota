// To parse this JSON data, do
//
//     final registerFailedModel = registerFailedModelFromJson(jsonString);

import 'dart:convert';

RegisterFailedModel registerFailedModelFromJson(String str) => RegisterFailedModel.fromJson(json.decode(str));

String registerFailedModelToJson(RegisterFailedModel data) => json.encode(data.toJson());

class RegisterFailedModel {
    Meta meta;

    RegisterFailedModel({
        required this.meta,
    });

    factory RegisterFailedModel.fromJson(Map<String, dynamic> json) => RegisterFailedModel(
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
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
