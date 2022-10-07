// To parse this JSON data, do
//
//     final infModel = infModelFromJson(jsonString);

import 'dart:convert';

List<InfModel> infModelFromJson(String str) =>
    List<InfModel>.from(json.decode(str).map((x) => InfModel.fromJson(x)));

String infModelToJson(List<InfModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfModel {
  InfModel({
    this.id,
    this.username,
    this.name,
    this.follower,
    this.genderM,
    this.genderF,
    this.age,
  });

  Id id;
  String username;
  String name;
  int follower;
  int genderM;
  int genderF;
  List<Map<String, int>> age;

  factory InfModel.fromJson(Map<String, dynamic> json) => InfModel(
        id: json["_id"] == null ? null : Id.fromJson(json["_id"]),
        username: json["username"] == null ? null : json["username"],
        name: json["name"] == null ? null : json["name"],
        follower: json["follower"] == null ? null : json["follower"],
        genderM: json["genderM"] == null ? null : json["genderM"],
        genderF: json["genderF"] == null ? null : json["genderF"],
        age: json["age"] == null
            ? null
            : List<Map<String, int>>.from(json["age"].map(
                (x) => Map.from(x).map((k, v) => MapEntry<String, int>(k, v)))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id.toJson(),
        "username": username == null ? null : username,
        "name": name == null ? null : name,
        "follower": follower == null ? null : follower,
        "genderM": genderM == null ? null : genderM,
        "genderF": genderF == null ? null : genderF,
        "age": age == null
            ? null
            : List<dynamic>.from(age.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}

class Id {
  Id({
    this.oid,
  });

  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"] == null ? null : json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid == null ? null : oid,
      };
}
