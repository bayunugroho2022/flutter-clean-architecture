import 'dart:async';

import 'package:clean_architecture/domain/usecase/login_usecase.dart';
import 'package:clean_architecture/presentation/base/baseviewmodel.dart';
import 'package:clean_architecture/presentation/common/freezed_data_classes.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_renderer.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutputs {
  final _userNameStreamController = StreamController<String>.broadcast();
  final _passwordStreamController = StreamController<String>.broadcast();
  final _isAllInputsValidStreamController = StreamController<void>.broadcast();
  final isUserLoggedInSuccessfully = StreamController<bool>();
  var loginObject = LoginObject("", "");

  LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _userNameStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
    isUserLoggedInSuccessfully.close();
  }

  @override
  void start() {
    //view tells state renderer, please how the content of the screen
    inputState.add(ContentState());
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE,
                      failure.message))
                },
            (data)  {
              print('sukses');
            });
  }

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => isUsernameValid(userName));

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  setUsername(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool isUsernameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return isPasswordValid(loginObject.password) &&
        isUsernameValid(loginObject.userName);
  }

  @override
  // TODO: implement inputIsAllInputValid
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  // TODO: implement outputIsAllInputsValid
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());
}

abstract class LoginViewModelInput {
  setUsername(String userName);

  setPassword(String password);

  login();

  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
