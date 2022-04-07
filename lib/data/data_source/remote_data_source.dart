import 'dart:convert';

import 'package:clean_architecture/data/network/app_api.dart';
import 'package:clean_architecture/data/network/end_point.dart';
import 'package:clean_architecture/data/requests/request.dart';
import 'package:clean_architecture/data/responses/response_forgot_password.dart';
import 'package:clean_architecture/data/responses/response_login.dart';

abstract class RemoteDataSource {
  Future<ResponseLogin> login(LoginRequest loginRequest);

  Future<ResponseForgotPassword> forgotPassword(String email);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServicesClient? _appServicesClient;

  RemoteDataSourceImplementer(this._appServicesClient);

  @override
  Future<ResponseLogin> login(LoginRequest loginRequest) async {
    final response =
        await _appServicesClient!.post(endPoint: EndPoint.login, requestBody: {
      "email": loginRequest.email,
      "": loginRequest.password,
      "imei": loginRequest.imei,
      "device_type": loginRequest.deviceType
    });
    // final res = json.decode(response) as Map<String, dynamic>;
    return ResponseLogin.fromJson(json.decode(response));
  }

  @override
  Future<ResponseForgotPassword> forgotPassword(String email) async {
    final response = await _appServicesClient!
        .post(endPoint: EndPoint.forgotPassword, requestBody: {"email": email});
    return ResponseForgotPassword.fromJson(response);
    // return ResponseForgotPassword.fromJson(json.decode(response));
  }
}
