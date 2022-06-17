import 'package:clean_architecture/data/data_source/local_data_source.dart';
import 'package:clean_architecture/data/responses/response_home.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";

class LocalDataSourceImplementer implements LocalDataSource {
  Map<String, CacheItem> cacheMap = Map();

  @override
  Future<ResponseHome> getHome() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveHomeToCache(ResponseHome responseHome) async {
    cacheMap[CACHE_HOME_KEY] = CacheItem(responseHome);
  }
}

class CacheItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CacheItem(this.data);
}
