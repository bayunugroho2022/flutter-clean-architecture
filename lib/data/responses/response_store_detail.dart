class ResponseStoreDetail {
  int? status;
  String? message;
  String? image;
  int? id;
  String? title;
  String? details;
  String? services;
  String? about;

  ResponseStoreDetail(
      {this.status,
        this.message,
        this.image,
        this.id,
        this.title,
        this.details,
        this.services,
        this.about});

  ResponseStoreDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    image = json['image'];
    id = json['id'];
    title = json['title'];
    details = json['details'];
    services = json['services'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['image'] = this.image;
    data['id'] = this.id;
    data['title'] = this.title;
    data['details'] = this.details;
    data['services'] = this.services;
    data['about'] = this.about;
    return data;
  }
}