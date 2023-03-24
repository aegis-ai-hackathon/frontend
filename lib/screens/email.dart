import 'package:aegis/controllers/email_controller.dart';
import 'package:aegis/widgets/reported_spam_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  EmailController emailController = Get.put(EmailController());

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
                  'Stop drowning in a sea of spam - Let our email spam detection be your lifeguard',
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
                        controller: emailController.emailController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          filled: true,
                          labelText: 'Enter email ID',
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.04),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TextField(
                        controller: emailController.emailContentController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          filled: true,
                          labelText: 'Enter email content',
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
                              emailController.isReportedSpam = true;
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
                              emailController.isReportedSpam = false;
                              emailController.checkDetectedEmail();
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
                            child: const Text('Check detected mail'),
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
