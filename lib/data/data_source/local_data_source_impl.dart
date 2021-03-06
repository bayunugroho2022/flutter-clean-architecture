import 'package:clean_architecture/app/extentions.dart';
import 'package:clean_architecture/data/data_source/local_data_source.dart';
import 'package:clean_architecture/data/network/error_handler.dart';
import 'package:clean_architecture/data/responses/response_home.dart';
import 'package:clean_architecture/data/responses/response_store_detail.dart';
import 'package:clean_architecture/domain/model/model.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";
const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 30s IN MILLIS

class LocalDataSourceImplementer implements LocalDataSource {
  Map<String, CachedItem> cacheMap = Map();

  @override
  Future<ResponseHome> getHome() async{
    CachedItem? cacheItem = cacheMap[CACHE_HOME_KEY];

    if(cacheItem != null && cacheItem.isValid(CACHE_HOME_INTERVAL)){
      //return response from cache
      return cacheItem.data;
    }else{
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(ResponseHome responseHome) async {
    cacheMap[CACHE_HOME_KEY] = CachedItem(responseHome);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<ResponseStoreDetail> getStoreDetails(int id) async{
    CachedItem? cachedItem = cacheMap[CACHE_STORE_DETAILS_KEY];

    if (cachedItem != null &&
        cachedItem.isValid(CACHE_STORE_DETAILS_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveStoreDetailsToCache(ResponseStoreDetail response) async {
    cacheMap[CACHE_STORE_DETAILS_KEY] = CachedItem(response);
  }
}