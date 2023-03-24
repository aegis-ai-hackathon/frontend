import 'dart:convert';

import 'package:aegis/constants/urls.dart';
import 'package:aegis/controllers/email_spammer_controller.dart';
import 'package:aegis/models/email_spammer_info.dart';
import 'package:aegis/screens/spammer_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmailController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController emailContentController = TextEditingController();
  bool isReportedSpam = false;
  SpammerController spammerController = Get.put(SpammerController());

  checkDetectedEmail() async {
    Map data = {
      "email_id": emailController.text.trim(),
      "content": emailContentController.text.trim(),
    };

    var url = Uri.parse(emailUrl);
    var response;
    try {
      response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        spammerController.emailSpammerInfoModel =
            EmailSpammerInfoModel.fromJson(
          jsonDecode(response.body),
        );
        emailController.clear();
        emailContentController.clear();

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
