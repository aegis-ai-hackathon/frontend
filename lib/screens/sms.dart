import 'package:aegis/controllers/sms_controller.dart';
import 'package:aegis/widgets/reported_spam_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SMSPage extends StatefulWidget {
  const SMSPage({super.key});

  @override
  State<SMSPage> createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {
  SmsController smsController = Get.put(SmsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FE),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20,
                left: 30,
                right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aegis',
                      style: TextStyle(
                        color: const Color(0xFF232526),
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' AI',
                      style: TextStyle(
                        color: const Color(0xFF16A86A),
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.03),
                const Text(
                  'Stop spam dead in its tracks with our\nSMS detection technology',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF232526),
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextField(
                        controller: smsController.phoneNoController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          filled: true,
                          labelText: 'Enter phone no.',
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextField(
                        controller: smsController.smsContentController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          filled: true,
                          labelText: 'Enter sms content',
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              smsController.isReportedSpam = true;
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ReportedSpamDialog();
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF232526).withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                            child: const Text('Report as spam'),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              smsController.isReportedSpam = false;
                              smsController.checkDetectedSMS();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF232526).withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            ),
                            child: const Text('Check detected sms'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
