import 'package:clean_architecture/domain/model/model.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension CachedItemExtention on CachedItem{
  bool isValid(int expirationTime){
    // expirationTime is 60 60 secs
    int currentTimeInmillis = DateTime.now().millisecondsSinceEpoch; // time now is 2:00:00 pm
    bool isCacheValid = currentTimeInmillis - expirationTime < cacheTime; //cache time was in 12:59:30

    return isCacheValid;
  }
}