import 'package:clean_architecture/data/requests/request.dart';
import 'package:clean_architecture/data/responses/response_forgot_password.dart';
import 'package:clean_architecture/data/responses/response_home.dart';
import 'package:clean_architecture/data/responses/response_login.dart';
import 'package:clean_architecture/data/responses/response_store_detail.dart';

abstract class RemoteDataSource {

  Future<ResponseLogin> login(LoginRequest loginRequest);

  Future<ResponseForgotPassword> forgotPassword(String email);

  Future<ResponseLogin> register(RegisterRequest registerRequest);

  Future<ResponseHome> getHome();

  Future<ResponseStoreDetail> getStoreDetail(int id);
}
