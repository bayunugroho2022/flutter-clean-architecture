class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}


class CustomerModel{
  String? id;
  String? name;
  int? numOfNotifications;

  CustomerModel(this.id, this.name, this.numOfNotifications);
}

class ContactModel{
  String? phone;
  String? link;
  String? email;

  ContactModel(this.phone, this.link, this.email);
}

class Authentication{
  CustomerModel? customerModel;
  ContactModel? contactModel;

  Authentication(this.customerModel, this.contactModel);
}

class DeviceInfo{
  String? name;
  String? identifier;
  String? version;

  DeviceInfo(this.name, this.identifier, this.version);
}