import 'dart:convert';

import 'package:clean_architecture/app/constant.dart';
import 'package:dio/dio.dart';


class AppServicesClient {

  Dio dio;

  AppServicesClient(this.dio);

  Future<dynamic> post({String? endPoint, Map<String, dynamic>? requestBody}) async {
    Response response;
    String getUrl = getBaseUrl(endPoint!);
    response = await dio.post(getUrl,
        data: jsonEncode(requestBody),
        options: Options(headers: getHeader()));
    return response.data;
  }

  Future<dynamic> get({String? endPoint}) async {
    Response response;
    String getUrl = getBaseUrl(endPoint!);
    response = await dio.get(getUrl,
        options: Options(headers: getHeader()));
    return response.data;
  }


  String getBaseUrl(String url){
    return Constant.baseUrl + url;
  }

  Map<String,dynamic> getHeader() {
    return {
      "Content-Type": "application/json"
    };
  }

}