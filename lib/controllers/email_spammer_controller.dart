import 'package:aegis/models/email_spammer_info.dart';
import 'package:aegis/models/sms_spammer_info.dart';

import 'package:get/get.dart';

class SpammerController extends GetxController {
  EmailSpammerInfoModel emailSpammerInfoModel = EmailSpammerInfoModel(
    emailId: '',
    spam: false,
    spamsReported: 0,
  );
  SMSSpammerInfoModel smsSpammerInfoModel = SMSSpammerInfoModel(
    phoneNo: '',
    spam: false,
    spamsReported: 0,
  );
}
