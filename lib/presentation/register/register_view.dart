import 'package:clean_architecture/app/locator.dart';
import 'package:clean_architecture/presentation/register/register_viewmodel.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _viewModel = instance <RegisterViewModel>();
  final _formKey = GlobalKey<FormState>();

  final _usernameTextEditingController = TextEditingController();
  final _mobileNumberTextEditingController = TextEditingController();
  final _userEmailTextEditingController = TextEditingController();
  final _userPasswordTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
  }

  _bind(){
    _viewModel.start();

    _usernameTextEditingController.addListener(() {
      _viewModel.setUserName(_usernameTextEditingController.text);
    });

    _userEmailTextEditingController.addListener(() {
      _viewModel.setEmail(_userEmailTextEditingController.text);
    });

    _userPasswordTextEditingController.addListener(() {
      _viewModel.setPassword(_userEmailTextEditingController.text);
    });

    _mobileNumberTextEditingController.addListener(() {
      _viewModel.setMobileNumber(_mobileNumberTextEditingController.text);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
