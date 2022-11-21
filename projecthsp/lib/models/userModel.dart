import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));
String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.fullname,
    this.lastname,
    this.sex,
    this.birthday,
    this.email,
    this.tel,
    this.address,
    this.bloodType,
    this.password,
  });

  dynamic id;
  dynamic fullname;
  dynamic lastname;
  dynamic sex;
  dynamic birthday;
  dynamic email;
  dynamic tel;
  dynamic address;
  dynamic bloodType;
  dynamic password;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        fullname: json["fullname"],
        lastname: json["lastname"],
        sex: json["sex"],
        birthday: DateTime.parse(json["birthday"]),
        email: json["email"],
        tel: json["tel"],
        address: json["address"],
        bloodType: json["blood_type"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "lastname": lastname,
        "sex": sex,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "email": email,
        "tel": tel,
        "address": address,
        "blood_type": bloodType,
        "password": password,
      };
}
