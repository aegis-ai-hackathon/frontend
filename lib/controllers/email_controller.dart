import 'package:aegis/screens/spammer_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController emailContentController = TextEditingController();
  bool isReportedSpam = false;

  checkDetectedEmail() {
    print(emailController.text);
    print(emailContentController.text);
    print(isReportedSpam);
    Get.to(() => const SpammerInfoPage(title: 'Spam Detected by Aegis AI'));
  }
}
