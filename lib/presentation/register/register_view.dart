import 'package:clean_architecture/app/locator.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_architecture/presentation/register/register_viewmodel.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/value_manager.dart';
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
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        iconTheme: IconThemeData(color: ColorManager.primary),
        backgroundColor: ColorManager.white,
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),() {
                _viewModel.register();
              }) ?? _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget(){
    return Container();
  }
}
