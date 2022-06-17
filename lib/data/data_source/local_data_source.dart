import 'package:clean_architecture/data/responses/response_home.dart';

abstract class LocalDataSource {
  Future<ResponseHome> getHome();

  Future<void> saveHomeToCache(ResponseHome responseHome);

}
