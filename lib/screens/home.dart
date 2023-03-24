import 'package:aegis/controllers/sms_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              TextField(
                controller: smsController.phoneNoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter phone no.',
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              TextField(
                controller: smsController.smsContentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter sms content',
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      smsController.isReportedSpam = true;
                      smsController.checkDetectedSMS();
                    },
                    child: const Text('Report as spam'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      smsController.isReportedSpam = false;
                      smsController.checkDetectedSMS();
                    },
                    child: const Text('Check detected sms'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
