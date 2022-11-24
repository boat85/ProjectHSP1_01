// To parse this JSON data, do
//
//     final bmi = bmiFromJson(jsonString);

import 'dart:convert';

List<Bmi> bmiFromJson(String str) =>
    List<Bmi>.from(json.decode(str).map((x) => Bmi.fromJson(x)));

String bmiToJson(List<Bmi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bmi {
  Bmi({
    this.id,
    this.idUser,
    this.weight,
    this.height,
    this.bmi,
    this.datetime,
  });

  dynamic id;
  dynamic idUser;
  dynamic weight;
  dynamic height;
  dynamic bmi;
  dynamic datetime;

  factory Bmi.fromJson(Map<String, dynamic> json) => Bmi(
        id: json["id"],
        idUser: json["id_user"],
        weight: json["weight"],
        height: json["height"],
        bmi: json["bmi"],
        datetime: DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "weight": weight,
        "height": height,
        "bmi": bmi,
        "datetime": datetime.toIso8601String(),
      };
}
