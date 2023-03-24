import 'package:aegis/screens/spammer_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SmsController extends GetxController {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController smsContentController = TextEditingController();
  bool isReportedSpam = false;

  checkDetectedSMS() {
    print(phoneNoController.text);
    print(smsContentController.text);
    print(DateTime.now());
    print(isReportedSpam);
    Get.to(() => const SpammerInfoPage(title: 'Spam Detected by Aegis AI'));
  }
}
