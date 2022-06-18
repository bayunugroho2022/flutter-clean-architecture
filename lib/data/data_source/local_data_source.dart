import 'package:clean_architecture/data/responses/response_home.dart';
import 'package:clean_architecture/data/responses/response_store_detail.dart';

abstract class LocalDataSource {
  Future<ResponseHome> getHome();
  Future<ResponseStoreDetail> getStoreDetails(int id);

  Future<void> saveHomeToCache(ResponseHome responseHome);
  Future<void> saveStoreDetailsToCache(ResponseStoreDetail response);

  void clearCache();
  void removeFromCache(String key);
}
