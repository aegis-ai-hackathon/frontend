import 'package:aegis/controllers/sms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpammerInfoPage extends StatefulWidget {
  const SpammerInfoPage({super.key, required this.title});

  final String title;

  @override
  State<SpammerInfoPage> createState() => _SpammerInfoPageState();
}

class _SpammerInfoPageState extends State<SpammerInfoPage> {
  SmsController smsController = Get.put(SmsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              const Text(
                '+91 1234567890',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              const Text(
                '1234 SPAM REPORTS',
                style: TextStyle(
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
