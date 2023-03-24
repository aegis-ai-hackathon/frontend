import 'dart:convert';

import 'package:aegis/constants/urls.dart';
import 'package:aegis/models/sms_spammer_info.dart';
import 'package:aegis/screens/spammer_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'email_spammer_controller.dart';

class SmsController extends GetxController {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController smsContentController = TextEditingController();
  bool isReportedSpam = false;
  SpammerController spammerController = Get.put(SpammerController());

  checkDetectedSMS() async {
    Map data = {
      "phone_no": phoneNoController.text.trim(),
      "content": smsContentController.text.trim(),
    };

    var url = Uri.parse(smsUrl);

    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        spammerController.smsSpammerInfoModel = SMSSpammerInfoModel.fromJson(
          jsonDecode(response.body),
        );
        phoneNoController.clear();
        smsContentController.clear();

        Get.to(() => const SpammerInfoPage(title: 'Spam Detected by Aegis AI'));
        return true;
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      // show error pop up
      print(e);
      return false;
    }
  }
}
