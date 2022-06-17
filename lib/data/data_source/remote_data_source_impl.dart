import 'dart:convert';

import 'package:clean_architecture/data/data_source/remote_data_source.dart';
import 'package:clean_architecture/data/network/app_api.dart';
import 'package:clean_architecture/data/network/end_point.dart';
import 'package:clean_architecture/data/requests/request.dart';
import 'package:clean_architecture/data/responses/response_forgot_password.dart';
import 'package:clean_architecture/data/responses/response_home.dart';
import 'package:clean_architecture/data/responses/response_login.dart';

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
    return ResponseLogin.fromJson(json.decode(response));
  }

  @override
  Future<ResponseForgotPassword> forgotPassword(String email) async {
    final response = await _appServicesClient!
        .post(endPoint: EndPoint.forgotPassword, requestBody: {"email": email});
    return ResponseForgotPassword.fromJson(response);
  }

  @override
  Future<ResponseLogin> register(RegisterRequest registerRequest) async {
    final response = await _appServicesClient!
        .post(endPoint: EndPoint.register, requestBody: {
      "country_mobile_code": registerRequest.countryMobileCode,
      "user_name": registerRequest.userName,
      "email": registerRequest.email,
      "password": registerRequest.password,
      "mobile_number": registerRequest.mobileNumber,
      "profile_picture": registerRequest.profilePicture,
    });

    return ResponseLogin.fromJson(json.decode(response));
  }

  @override
  Future<ResponseHome> getHome() async {
    final response =  await _appServicesClient!.get(endPoint: EndPoint.home);
    return ResponseHome.fromJson(response);
  }
}
