import 'package:dio/dio.dart';
import 'package:projecthsp/models/PressureModel.dart';

class BMIProvider {
  String host = "127.0.0.1:8000";

  Future<List<Pressure>> getDataPressure() async {
    String bmi = "http://${host}/getdataPressureALL/";
    Response response = await Dio().get(bmi);
    return (response.data as List).map((e) => Pressure.fromJson(e)).toList();
  }

  Future<List<Pressure>> getDataPressurebyID(String id) async {
    String bmi = "http://${host}/getdataPressurebyID/${id}/";
    Response response = await Dio().get(bmi);
    return (response.data as List).map((e) => Pressure.fromJson(e)).toList();
  }

  Future<Pressure> addPressure(
    dynamic idUser,
    dynamic pressure,
    dynamic datetime,
  ) async {
    var url = "http://${host}/createPressure/";
    Response response = await Dio().post(url, data: {
      'idUser': idUser,
      'pressure': pressure,
      'datetime': datetime,
    });
    return Pressure.fromJson(response.data);
  }
}
