import 'package:aegis/models/sms_spammer_info.dart';

import 'package:get/get.dart';

class SpammerController extends GetxController {
  SMSSpammerInfoModel spammerInfoModel = SMSSpammerInfoModel(
    phoneNo: '',
    spam: false,
    spamsReported: 0,
  );
}
