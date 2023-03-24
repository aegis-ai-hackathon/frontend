import 'package:aegis/models/sms_spammer_info.dart';

import 'package:get/get.dart';

class SpammerController extends GetxController {
  SMSSpammerInfoModel spammerInfoModel = SMSSpammerInfoModel(
    sms: '',
    spam: false,
    spamsReported: 0,
    confidenceScore: 0,
  );
}
