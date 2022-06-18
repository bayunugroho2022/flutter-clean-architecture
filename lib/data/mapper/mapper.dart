import 'package:clean_architecture/app/extentions.dart';
import 'package:clean_architecture/data/responses/response_forgot_password.dart';
import 'package:clean_architecture/data/responses/response_home.dart';
import 'package:clean_architecture/data/responses/response_login.dart';
import 'package:clean_architecture/data/responses/response_store_detail.dart';
import 'package:clean_architecture/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on Customer {
  CustomerModel toDomain() {
    return CustomerModel(
      id?.orEmpty() ?? EMPTY,
      name?.orEmpty() ?? EMPTY,
      numOfNotifications?.orZero() ?? ZERO,
    );
  }
}

extension ResponseForgotPasswordMapper on ResponseForgotPassword {
  String toDomain() {
    return support?.orEmpty() ?? EMPTY;
  }
}

extension ContactResponseMapper on Contact {
  ContactModel toDomain() {
    return ContactModel(
      email?.orEmpty() ?? EMPTY,
      link?.orEmpty() ?? EMPTY,
      phone?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationMapper on ResponseLogin {
  Authentication toDomain() {
    return Authentication(
      customer!.toDomain(),
      contact!.toDomain(),
    );
  }
}

extension ServiceResponseMapper on Services {
  ServiceModel toDomain() {
    return ServiceModel(
      id!.orZero(),
      title?.orEmpty() ?? EMPTY,
      image?.orEmpty() ?? EMPTY,
    );
  }
}

extension BannerResponseMapper on Banners {
  BannerModel toDomain() {
    return BannerModel(
      id!.orZero(),
      title?.orEmpty() ?? EMPTY,
      image?.orEmpty() ?? EMPTY,
      link?.orEmpty() ?? EMPTY,
    );
  }
}

extension StoreDetailResponseMapper on ResponseStoreDetail {
  StoreDetailModel toDomain() {
    return StoreDetailModel(
      about: about?.orEmpty() ?? EMPTY,
      details: details?.orEmpty() ?? EMPTY,
      image: image?.orEmpty() ?? EMPTY,
      id: id!.orZero(),
      services: services?.orEmpty() ?? EMPTY,
      title: title?.orEmpty() ?? EMPTY,
    );
  }
}

extension StoreResponseMapper on Stores {
  StoreModel toDomain() {
    return StoreModel(
      id!.orZero(),
      title?.orEmpty() ?? EMPTY,
      image?.orEmpty() ?? EMPTY,
    );
  }
}

extension HomeResponseMapper on ResponseHome {
  HomeObject toDomain() {
    List<ServiceModel>? mappedServices =
        (this.data?.services?.map((service) => service.toDomain()) ??
                const Iterable.empty())
            .cast<ServiceModel>()
            .toList();

    List<StoreModel>? mappedStores =
        (this.data?.stores?.map((store) => store.toDomain()) ??
                const Iterable.empty())
            .cast<StoreModel>()
            .toList();

    List<BannerModel>? mappedBanners =
        (this.data?.banners?.map((banner) => banner.toDomain()) ??
                const Iterable.empty())
            .cast<BannerModel>()
            .toList();

    var data = HomeData(mappedServices, mappedStores, mappedBanners);
    return HomeObject(data);
  }
}
