import 'dart:convert';

List<Pressure> pressureFromJson(String str) =>
    List<Pressure>.from(json.decode(str).map((x) => Pressure.fromJson(x)));

String pressureToJson(List<Pressure> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pressure {
  Pressure({
    this.id,
    this.idUser,
    this.pressure,
    this.datetime,
  });

  dynamic id;
  dynamic idUser;
  dynamic pressure;
  dynamic datetime;

  factory Pressure.fromJson(Map<String, dynamic> json) => Pressure(
        id: json["id"],
        idUser: json["id_user"],
        pressure: json["pressure"],
        datetime: DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "pressure": pressure,
        "datetime": datetime.toIso8601String(),
      };
}
