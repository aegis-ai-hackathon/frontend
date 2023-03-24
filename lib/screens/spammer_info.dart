import 'package:aegis/controllers/email_spammer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpammerInfoPage extends StatefulWidget {
  const SpammerInfoPage({super.key, required this.title});

  final String title;

  @override
  State<SpammerInfoPage> createState() => _SpammerInfoPageState();
}

class _SpammerInfoPageState extends State<SpammerInfoPage> {
  SpammerController spammerController = Get.put(SpammerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FE),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red.withOpacity(0.2),
                ),
                child: const Icon(
                  Icons.warning_amber_outlined,
                  size: 75,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Text(
                spammerController.emailSpammerInfoModel.emailId.isEmpty
                    ? spammerController.smsSpammerInfoModel.sms
                    : spammerController.emailSpammerInfoModel.emailId,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              Text(
                '${spammerController.emailSpammerInfoModel.emailId.isEmpty ? spammerController.smsSpammerInfoModel.spamsReported : spammerController.emailSpammerInfoModel.spamsReported} SPAM REPORTS',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
