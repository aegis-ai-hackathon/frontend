// To parse this JSON data, do
//
//     final spammerInfoModel = spammerInfoModelFromJson(jsonString);

import 'dart:convert';

EmailSpammerInfoModel emailSpammerInfoModelFromJson(String str) =>
    EmailSpammerInfoModel.fromJson(json.decode(str));

String emailSpammerInfoModelToJson(EmailSpammerInfoModel data) =>
    json.encode(data.toJson());

class EmailSpammerInfoModel {
  EmailSpammerInfoModel({
    required this.emailId,
    required this.spam,
    required this.spamsReported,
  });

  String emailId;
  bool spam;
  int spamsReported;

  factory EmailSpammerInfoModel.fromJson(Map<String, dynamic> json) =>
      EmailSpammerInfoModel(
        emailId: json["email_id"],
        spam: json["spam"],
        spamsReported: json["spams_reported"],
      );

  Map<String, dynamic> toJson() => {
        "email_id": emailId,
        "spam": spam,
        "spams_reported": spamsReported,
      };
}
