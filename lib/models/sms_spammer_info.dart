// To parse this JSON data, do
//
//     final spammerInfoModel = spammerInfoModelFromJson(jsonString);

import 'dart:convert';

SMSSpammerInfoModel smsSpammerInfoModelFromJson(String str) =>
    SMSSpammerInfoModel.fromJson(json.decode(str));

String smsSpammerInfoModelToJson(SMSSpammerInfoModel data) =>
    json.encode(data.toJson());

class SMSSpammerInfoModel {
  SMSSpammerInfoModel({
    required this.sms,
    required this.spam,
    required this.spamsReported,
    required this.confidenceScore,
  });

  String sms;
  bool spam;
  int spamsReported;
  int confidenceScore;

  factory SMSSpammerInfoModel.fromJson(Map<String, dynamic> json) =>
      SMSSpammerInfoModel(
        sms: json["sms"],
        spam: json["spam"],
        spamsReported: json["spams_reported"],
        confidenceScore: json["confidence_score"],
      );

  Map<String, dynamic> toJson() => {
        "sms": sms,
        "spam": spam,
        "spams_reported": spamsReported,
        "confidence_score": confidenceScore,
      };
}
