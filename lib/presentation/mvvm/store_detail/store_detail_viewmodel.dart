import 'package:clean_architecture/domain/model/model.dart';
import 'package:clean_architecture/domain/usecase/store_detail_usecase.dart';
import 'package:clean_architecture/presentation/base/baseviewmodel.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_render_impl.dart';
import 'package:clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailsViewModel extends BaseViewModel with StoreDetailsViewModelInput, StoreDetailsViewModelOutput {
  final StoreDetailUseCase storeDetailsUseCase;
  StoreDetailsViewModel(this.storeDetailsUseCase);

  final _storeDetailsStreamController = BehaviorSubject<StoreDetailModel>();

  @override
  void start() {
    _loadData();
  }

  @override
  void dispose() {
    _storeDetailsStreamController.close();
    super.dispose();
  }

  void _loadData() async{
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await storeDetailsUseCase.execute(1)).fold((failure){
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (success) {
      inputState.add(ContentState());
      inputStoreDetails.add(success);
    });
  }

  @override
  // TODO: implement inputStoreDetails
  Sink get inputStoreDetails => _storeDetailsStreamController.sink;

  @override
  // TODO: implement outputStoreDetails
  Stream<StoreDetailModel> get outputStoreDetails => _storeDetailsStreamController.stream.map((event) => event);

}

abstract class StoreDetailsViewModelInput {
  Sink get inputStoreDetails;
}

abstract class StoreDetailsViewModelOutput {
  Stream<StoreDetailModel> get outputStoreDetails;
}
