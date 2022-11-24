import 'package:dio/dio.dart';
import 'package:projecthsp/models/BMIModel.dart';

class BMIProvider {
  String host = "127.0.0.1:8000";

  Future<List<Bmi>> getDataBMI() async {
    String bmi = "http://${host}/getdataBMIALL/";
    Response response = await Dio().get(bmi);
    return (response.data as List).map((e) => Bmi.fromJson(e)).toList();
  }

  Future<List<Bmi>> getDataBMIbyID(String id) async {
    String bmi = "http://${host}/getdataBMIALL/${id}/";
    Response response = await Dio().get(bmi);
    return (response.data as List).map((e) => Bmi.fromJson(e)).toList();
  }

  Future<Bmi> addBMI(
    dynamic idUser,
    dynamic weight,
    dynamic height,
    dynamic bmi,
    dynamic datetime,
  ) async {
    var url = "http://${host}/createBMI/";
    Response response = await Dio().post(url, data: {
      'idUser': idUser,
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'datetime': datetime,
    });
    return Bmi.fromJson(response.data);
  }
}
