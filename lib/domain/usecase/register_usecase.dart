import 'package:clean_architecture/app/function.dart';
import 'package:clean_architecture/data/network/failure.dart';
import 'package:clean_architecture/data/requests/request.dart';
import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.register(RegisterRequest(
      email: input.email,
      password: input.password,
      profilePicture: input.profilePicture,
      mobileNumber: input.mobileNumber,
      userName: input.userName,
      countryMobileCode: input.countryMobileCode,
    ));
  }
}

class RegisterUseCaseInput {
  String? countryMobileCode;
  String? userName;
  String? email;
  String? password;
  String? mobileNumber;
  String? profilePicture;

  RegisterUseCaseInput(
      {this.countryMobileCode,
      this.userName,
      this.email,
      this.password,
      this.mobileNumber,
      this.profilePicture});
}
