import 'package:clean_architecture/app/app_prefs.dart';
import 'package:clean_architecture/data/data_source/local_data_source.dart';
import 'package:clean_architecture/data/data_source/local_data_source_impl.dart';
import 'package:clean_architecture/data/repository/repository_impl.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/forgot_password_usecase.dart';
import 'package:clean_architecture/domain/usecase/home_usecase.dart';
import 'package:clean_architecture/domain/usecase/login_usecase.dart';
import 'package:clean_architecture/domain/usecase/register_usecase.dart';
import 'package:clean_architecture/domain/usecase/store_detail_usecase.dart';
import 'package:clean_architecture/presentation/main/home/home_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_source/remote_data_source.dart';
import 'data/data_source/remote_data_source_impl.dart';
import 'data/network/app_api.dart';
import 'data/network/dio_factory.dart';
import 'data/network/network_info.dart';
import 'presentation/mvvm/forgot_password/forgot_password_viewmodel.dart';
import 'presentation/mvvm/login/login_viewmodel.dart';
import 'presentation/mvvm/register/register_viewmodel.dart';
import 'presentation/mvvm/store_detail/store_detail_viewmodel.dart';


final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServicesClient>(() => AppServicesClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementer(instance()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImplementer());

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance(), instance()));

}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(() =>
        ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(() =>
        ForgotPasswordViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(() => RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

initStoreDetailsModule(){
  if (!GetIt.I.isRegistered<StoreDetailUseCase>()) {
    instance.registerFactory<StoreDetailUseCase>(() => StoreDetailUseCase(instance()));
    instance.registerFactory<StoreDetailsViewModel>(() => StoreDetailsViewModel(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initHomeModule();
  initLoginModule();
  initRegisterModule();
  initForgotPasswordModule();
  initStoreDetailsModule();
}