class ValidasiRegister {
  Meta meta;

  ValidasiRegister({
    required this.meta,
  });

  factory ValidasiRegister.fromJson(Map<String, dynamic> json) =>
      ValidasiRegister(
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
