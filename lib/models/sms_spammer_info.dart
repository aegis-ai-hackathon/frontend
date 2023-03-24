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
    required this.phoneNo,
    required this.spam,
    required this.spamsReported,
  });

  String phoneNo;
  bool spam;
  int spamsReported;

  factory SMSSpammerInfoModel.fromJson(Map<String, dynamic> json) =>
      SMSSpammerInfoModel(
        phoneNo: json["phone_no"],
        spam: json["spam"],
        spamsReported: json["spams_reported"],
      );

  Map<String, dynamic> toJson() => {
        "phone_no": phoneNo,
        "spam": spam,
        "spams_reported": spamsReported,
      };
}
