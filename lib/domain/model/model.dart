class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class CustomerModel {
  String? id;
  String? name;
  int? numOfNotifications;

  CustomerModel(this.id, this.name, this.numOfNotifications);
}

class ContactModel {
  String? phone;
  String? link;
  String? email;

  ContactModel(this.phone, this.link, this.email);
}

class Authentication {
  CustomerModel? customerModel;
  ContactModel? contactModel;

  Authentication(this.customerModel, this.contactModel);
}

class DeviceInfo {
  String? name;
  String? identifier;
  String? version;

  DeviceInfo(this.name, this.identifier, this.version);
}

class ServiceModel {
  int? id;
  String? title;
  String? image;

  ServiceModel(this.id, this.title, this.image);
}

class BannerModel {
  int? id;
  String? title;
  String? image;
  String? link;

  BannerModel(this.id, this.title, this.image, this.link);
}

class StoreModel {
  int? id;
  String? title;
  String? image;

  StoreModel(this.id, this.title, this.image);
}

class HomeData{
  List<ServiceModel>? services;
  List<StoreModel>? stores;
  List<BannerModel>? banners;

  HomeData(this.services, this.stores, this.banners);
}

class HomeObject{
  HomeData? homeData;

  HomeObject(this.homeData);
}