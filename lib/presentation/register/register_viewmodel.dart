import 'dart:async';
import 'dart:io';

import 'package:clean_architecture/presentation/base/baseviewmodel.dart';

class RegisterViewModel extends BaseViewModel {

  final StreamController _userNameStreamController  = StreamController<String>.broadcast();
  final StreamController _mobileNumberStreamController  = StreamController<String>.broadcast();
  final StreamController _emailStreamController  = StreamController<String>.broadcast();
  final StreamController _passwordStreamController  = StreamController<String>.broadcast();
  final StreamController _profilePictureStreamController  = StreamController<File>.broadcast();
  final StreamController _isAllInputValidStreamController  = StreamController<void>.broadcast();

  @override
  void start() {}


  @override
  // ignore: unnecessary_overrides
  void dispose() {
    _isAllInputValidStreamController.close();
    _userNameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
     super.dispose();
  }
}

abstract class RegisterViewModelInput {
  void onUserNameChanged(String userName);
  void onMobileNumberChanged(String mobileNumber);
  void onEmailChanged(String email);
  void onPasswordChanged(String password);
  void onProfilePictureChanged(File profilePicture);
  void onRegisterButtonPressed();
}

abstract class RegisterViewModelOutput {
  Stream<String> get userNameStream;
  Stream<String> get mobileNumberStream;
  Stream<String> get emailStream;
  Stream<String> get passwordStream;
  Stream<File> get profilePictureStream;
  Stream<void> get isAllInputValidStream;
}

