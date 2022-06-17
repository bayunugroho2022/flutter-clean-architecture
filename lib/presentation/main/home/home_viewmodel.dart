import 'dart:ffi';

import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/domain/usecase/home_usecase.dart';
import 'package:clean_architecture/presentation/base/baseviewmodel.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel with HomeViewMovelInputs, HomeViewMovelOutputs{
  HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  final _dataStreamController = BehaviorSubject<HomeData>();

  @override
  void start() {
    _getHome();
  }

  _getHome() async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _homeUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (homeObject) {
      inputState.add(ContentState());
      inputHomeData.add(HomeData(
          homeObject.homeData?.services,
          homeObject.homeData?.stores,
          homeObject.homeData?.banners
      ));
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  // TODO: implement inputHomeData
  Sink get inputHomeData => _dataStreamController.sink;

  @override
  // TODO: implement outputHomeData
  Stream<HomeData> get outputHomeData => _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewMovelInputs {
  Sink get inputHomeData;
}

abstract class HomeViewMovelOutputs {
  Stream<HomeData> get outputHomeData;
}
