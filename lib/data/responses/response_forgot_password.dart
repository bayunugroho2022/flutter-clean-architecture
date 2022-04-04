import 'dart:convert';

ResponseForgotPassword responseForgotPasswordFromJson(String str) => ResponseForgotPassword.fromJson(json.decode(str));

String responseForgotPasswordToJson(ResponseForgotPassword data) => json.encode(data.toJson());

class ResponseForgotPassword {
  ResponseForgotPassword({
    this.status,
    this.message,
    this.support,
  });

  int? status;
  String? message;
  String? support;

  factory ResponseForgotPassword.fromJson(Map<String, dynamic> json) => ResponseForgotPassword(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    support: json["support"] == null ? null : json["support"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "support": support == null ? null : support,
  };
}
