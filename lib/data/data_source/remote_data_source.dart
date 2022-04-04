import 'dart:convert';

import 'package:clean_architecture/data/network/app_api.dart';
import 'package:clean_architecture/data/network/end_point.dart';
import 'package:clean_architecture/data/requests/request.dart';
import 'package:clean_architecture/data/responses/response_login.dart';

abstract class RemoteDataSource {
  Future<ResponseLogin> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServicesClient? _appServicesClient;

  RemoteDataSourceImplementer(this._appServicesClient);

  @override
  Future<ResponseLogin> login(LoginRequest loginRequest) async {
    final response =
        await _appServicesClient!.post(endPoint: EndPoint.login, requestBody: {
      "email": loginRequest.email,
      "password": loginRequest.password,
      "imei": loginRequest.imei,
      "device_type": loginRequest.deviceType
    });
    // final res = json.decode(response) as Map<String, dynamic>;
    return ResponseLogin.fromJson(json.decode(response));
  }
}
