import 'package:aegis/controllers/sms_controller.dart';
import 'package:aegis/screens/email.dart';
import 'package:aegis/screens/sms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'call.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SmsController smsController = Get.put(SmsController());
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FE),
      body: [
        const SMSPage(),
        const EmailPage(),
        const CallPage(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: const Color(0xFF16A86A).withOpacity(0.8),
        unselectedItemColor: const Color(0xFF232526).withOpacity(0.8),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sms_outlined),
            label: 'SMS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'E-MAIL',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'CALL',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
