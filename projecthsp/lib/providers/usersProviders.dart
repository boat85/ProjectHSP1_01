import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/userModel.dart';

class UsersProvider {
  // Get Data AllUser
  Future<List<Users>> getDataUser() async {
    const String url = "http://10.0.2.2:8000/getUsers/";
    Response response = await Dio().get(url);
    return (response.data as List).map((e) => Users.fromJson(e)).toList();
  }

  // Register User test
  // void regiterUser(Users user) async {
  //   const String url = "http://10.0.2.2:8000/create/";
  //   Response response = await Dio().post(url, data: jsonEncode(user.toMap()));
  // }

  // void regiterUser(Users user) async {
  //   print("test register");
  //   final url = Uri.parse("http://10.0.2.2:8000/create/");
  //   Response response = (await http.post(url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(user.toMap()))) as Response;
  //   if (response == 200) {
  //     print("ok");
  //   } else {
  //     print('NO');
  //   }
  // }

  // Register User test
  Future<Users> addUserd(
    dynamic fullname,
    dynamic lastname,
    dynamic sex,
    dynamic birthday,
    dynamic email,
    dynamic tel,
    dynamic address,
    dynamic blood_type,
    dynamic password,
  ) async {
    var url = "http://127.0.0.1/:8000/create/";
    Response response = await Dio().post(url, data: {
      'fullname': fullname,
      'lastname': lastname,
      'sex': sex,
      'birthday': birthday,
      'email': email,
      'tel': tel,
      'address': address,
      'blood_type': blood_type,
      'password': password
    });
    return Users.fromJson(response.data);
  }

  Future<Users> updateUserd(String fname, String lname, String id) async {
    final url = "http://127.0.0.1:8000/getUsers/${id}/update";
    Response response =
        await Dio().put(url, data: {'fname': fname, 'lname': lname});
    return Users.fromJson(response.data);
  }

  Future userdeleted(dynamic id) async {
    final url = "http://127.0.0.1:8000/getUsers/${id}/delete";
    Response response = await Dio().delete(url);
    return response.data;
  }

  // Future<Users?> createUser({required Users user}) async {
  //   Users? requiredUser;
  //   const String url = "http://10.0.2.2:8000/create/";

  //   try {
  //     Response response = await Dio().post(url, data: user.toJson());
  //     print('User created: ${response.data}');

  //     requiredUser = Users.fromJson(response.data);
  //   } catch (e) {
  //     print('Error creating user: $e');
  //   }
  //   return requiredUser;
  // }

}
