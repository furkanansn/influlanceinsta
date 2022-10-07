// To parse this JSON data, do
//
//     final genderAndAgeModel = genderAndAgeModelFromJson(jsonString);

import 'dart:convert';

GenderAndAgeModel genderAndAgeModelFromJson(String str) => GenderAndAgeModel.fromJson(json.decode(str));

String genderAndAgeModelToJson(GenderAndAgeModel data) => json.encode(data.toJson());

class GenderAndAgeModel {
  GenderAndAgeModel({
    this.data,
    this.errorMessage,
    this.success,
  });

  List<Datum> data;
  String errorMessage;
  bool success;

  factory GenderAndAgeModel.fromJson(Map<String, dynamic> json) => GenderAndAgeModel(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    errorMessage: json["errorMessage"] == null ? null : json["errorMessage"],
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "errorMessage": errorMessage == null ? null : errorMessage,
    "success": success == null ? null : success,
  };
}

class Datum {
  Datum({
    this.age,
    this.gender,
    this.username,
  });

  String age;
  Gender gender;
  String username;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    age: json["age"] == null ? null : json["age"],
    gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
    username: json["username"] == null ? null : json["username"],
  );

  Map<String, dynamic> toJson() => {
    "age": age == null ? null : age,
    "gender": gender == null ? null : genderValues.reverse[gender],
    "username": username == null ? null : username,
  };
}

enum Gender { MAN, WOMAN }

final genderValues = EnumValues({
  "Man": Gender.MAN,
  "Woman": Gender.WOMAN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
