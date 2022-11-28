import 'package:dio/dio.dart';

import '../models/CongenitalDModel.dart';

class CongenitalDProvider {
  String host = "127.0.0.1:8000";

  Future<List<CongenitalD>> getDataCongenitalD() async {
    String bmi = "http://${host}/getdataConDALL/";
    Response response = await Dio().get(bmi);
    return (response.data as List).map((e) => CongenitalD.fromJson(e)).toList();
  }

  Future<List<CongenitalD>> getDataCongenitalDbyID(String id) async {
    String bmi = "http://${host}/getdataConDbyID/${id}/";
    Response response = await Dio().get(bmi);
    return (response.data as List).map((e) => CongenitalD.fromJson(e)).toList();
  }

  Future<CongenitalD> addCongenitalD(
    dynamic idUser,
    dynamic nameCd,
    dynamic datetime,
  ) async {
    var url = "http://${host}/createConD/";
    Response response = await Dio().post(url, data: {
      'idUser': idUser,
      'pressure': nameCd,
      'datetime': datetime,
    });
    return CongenitalD.fromJson(response.data);
  }
}
