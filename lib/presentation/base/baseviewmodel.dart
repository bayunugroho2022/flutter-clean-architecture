import 'dart:async';

import 'package:clean_architecture/presentation/common/state_renderer/state_render_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {

  final _inputStateStreamController = StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  // TODO: implement outputState
  Stream<FlowState> get outputState => _inputStateStreamController.stream.map((flowstate) => flowstate);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }
  // shared variables and functions that will be used through any view model.
}

abstract class BaseViewModelInputs {
  void start(); // will be called while init. of view model
  void dispose(); // will be called when viewmodel dies.

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}