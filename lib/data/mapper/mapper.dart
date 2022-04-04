
import 'package:clean_architecture/app/extentions.dart';
import 'package:clean_architecture/data/responses/response_forgot_password.dart';
import 'package:clean_architecture/data/responses/response_login.dart';
import 'package:clean_architecture/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on Customer{
  CustomerModel toDomain(){
    return CustomerModel(
      this.id?.orEmpty() ?? EMPTY,
      this.name?.orEmpty() ?? EMPTY,
      this.numOfNotifications?.orZero() ?? ZERO,
    );
  }
}

extension ResponseForgotPasswordMapper on ResponseForgotPassword{
  String toDomain(){
    return support?.orEmpty() ?? EMPTY;
  }
}

extension ContactResponseMapper on Contact{
  ContactModel toDomain(){
    return ContactModel(
      this.email?.orEmpty() ?? EMPTY,
      this.link?.orEmpty() ?? EMPTY,
      this.phone?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationMapper on ResponseLogin{
  Authentication toDomain(){
    return Authentication(
      this.customer!.toDomain(),
      this.contact!.toDomain(),
    );
  }
}