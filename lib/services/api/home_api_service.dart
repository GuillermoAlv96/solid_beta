

import 'package:dio/dio.dart';
import 'package:solid_beta/constants/constants.dart';
import 'package:solid_beta/services/protocols/home_service_protocol.dart';

class HomeAPIService implements HomeServiceProtocol {
  /* SE USARIA INSTANCIA DE APISERVICE PARA HACER LAS PETICIONES
  late final ApiService _apiService;

  UserAPIService(ApiService apiService) {
    this._apiService = apiService;
  }
  */

  final dio = Dio();

  @override
  Future<String> getHomePageData() async {

    // params
    Map<String, dynamic> params = {
      "status[]": [
        "finalized",
      ],
      "page": 1,
    };
    
    // headers
    Map<String, dynamic> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['accept'] = 'application/ld+json';
    headers['Authorization'] = 'Bearer $token'; // ca
    dio.options.headers = headers;

    final response = await dio.get("$base_url/trips", queryParameters: params);
    if (response.statusCode == 200) {
      return response.data["message"];
    } else {
      throw response.data["message"];
    }
  }
}