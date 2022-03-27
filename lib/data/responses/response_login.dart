import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    this.status,
    this.message,
    this.customer,
    this.contact,
  });

  int? status;
  String? message;
  Customer? customer;
  Contact? contact;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
    status: json["status"],
    message: json["message"],
    customer: Customer.fromJson(json["customer"]),
    contact: Contact.fromJson(json["contact"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "customer": customer?.toJson(),
    "contact": contact?.toJson(),
  };
}

class Contact {
  Contact({
    this.phone,
    this.link,
    this.email,
  });

  String? phone;
  String? link;
  String? email;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    phone: json["phone"],
    link: json["link"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "link": link,
    "email": email,
  };
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.numOfNotifications,
  });

  String? id;
  String? name;
  int? numOfNotifications;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: json["name"],
    numOfNotifications: json["numOfNotifications"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "numOfNotifications": numOfNotifications,
  };
}
