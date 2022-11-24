// To parse this JSON data, do
//
//     final congenitalD = congenitalDFromJson(jsonString);

import 'dart:convert';

List<CongenitalD> congenitalDFromJson(String str) => List<CongenitalD>.from(
    json.decode(str).map((x) => CongenitalD.fromJson(x)));

String congenitalDToJson(List<CongenitalD> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CongenitalD {
  CongenitalD({
    this.id,
    this.idUser,
    this.nameCd,
    this.datetime,
  });

  dynamic id;
  dynamic idUser;
  dynamic nameCd;
  dynamic datetime;

  factory CongenitalD.fromJson(Map<String, dynamic> json) => CongenitalD(
        id: json["id"],
        idUser: json["id_user"],
        nameCd: json["name_cd"],
        datetime: DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "name_cd": nameCd,
        "datetime": datetime.toIso8601String(),
      };
}
