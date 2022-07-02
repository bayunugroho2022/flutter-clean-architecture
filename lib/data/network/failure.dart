import 'package:clean_architecture/data/network/error_handler.dart';

class Failure{
  int? code;
  String message;

  Failure(this.code, this.message);
}


class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}