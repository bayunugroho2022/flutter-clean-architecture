
import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/requests/request.dart';
import 'package:dartz/dartz.dart';

import '../model/model.dart';

abstract class Repository{
  
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
  
  Future<Either<Failure,String>> forgotPassword(String email);

  Future<Either<Failure,Authentication>> register(RegisterRequest registerRequest);

  Future<Either<Failure,HomeObject>> getHome();

  Future<Either<Failure,StoreDetailModel>> getStoreDetail(int id);
}