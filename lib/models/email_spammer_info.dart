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
    required this.confidenceScore,
  });

  String emailId;
  bool spam;
  int spamsReported;
  int confidenceScore;

  factory EmailSpammerInfoModel.fromJson(Map<String, dynamic> json) =>
      EmailSpammerInfoModel(
        emailId: json["email_id"],
        spam: json["spam"],
        spamsReported: json["spams_reported"],
        confidenceScore: json["confidence_score"],
      );

  Map<String, dynamic> toJson() => {
        "email_id": emailId,
        "spam": spam,
        "spams_reported": spamsReported,
        "confidence_score": confidenceScore,
      };
}
