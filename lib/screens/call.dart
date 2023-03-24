import 'package:aegis/controllers/sms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  SmsController smsController = Get.put(SmsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FE),
      body: Center(
        child: Text(
          'Coming Soon!',
          style: TextStyle(
            color: const Color(0xFF232526),
            fontSize: MediaQuery.of(context).size.width * 0.09,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
