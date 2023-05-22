// To parse this JSON data, do
//
//     final listHomeModel = listHomeModelFromJson(jsonString);

import 'dart:convert';

ListHomeModel listHomeModelFromJson(String str) => ListHomeModel.fromJson(json.decode(str));

String listHomeModelToJson(ListHomeModel data) => json.encode(data.toJson());

class ListHomeModel {
    Meta? meta;
    Data? data;

    ListHomeModel({
        this.meta,
        this.data,
    });

    factory ListHomeModel.fromJson(Map<String, dynamic> json) => ListHomeModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data?.toJson(),
    };
}

class Data {
    List<ListElement>? list;

    Data({
        this.list,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    String? type;
    List<ListType>? listType;

    ListElement({
        this.type,
        this.listType,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        type: json["type"],
        listType: json["listType"] == null ? [] : List<ListType>.from(json["listType"]!.map((x) => ListType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "listType": listType == null ? [] : List<dynamic>.from(listType!.map((x) => x.toJson())),
    };
}

class ListType {
    int? id;
    String? nama;
    String? imgMenu;
    int? isActive;
    String? category;
    int? groupId;
    int? sort;
    int? isHome;
    String? provider;

    ListType({
        this.id,
        this.nama,
        this.imgMenu,
        this.isActive,
        this.category,
        this.groupId,
        this.sort,
        this.isHome,
        this.provider,
    });

    factory ListType.fromJson(Map<String, dynamic> json) => ListType(
        id: json["id"],
        nama: json["nama"],
        imgMenu: json["img_menu"],
        isActive: json["isActive"],
        category: json["category"],
        groupId: json["group_id"],
        sort: json["sort"],
        isHome: json["is_home"],
        provider: json["provider"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "img_menu": imgMenu,
        "isActive": isActive,
        "category": category,
        "group_id": groupId,
        "sort": sort,
        "is_home": isHome,
        "provider": provider,
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
