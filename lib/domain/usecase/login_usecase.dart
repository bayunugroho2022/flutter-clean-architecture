import 'package:clean_architecture/app/function.dart';
import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/requests/request.dart';
import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(
        input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}

class LoginUseCaseInput {
  String? email;
  String? password;

  LoginUseCaseInput(this.email, this.password);
}
