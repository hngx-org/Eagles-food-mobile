import 'package:flutter/material.dart';
import 'package:hng_task3/screens/home/home_screen.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_success.dart';
// import 'package:hng_task3/screens/withdraw/withdraw_success_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*appBar: AppBar(
          title: const Text(
            'Lunch app',
          ),
          backgroundColor: Colors.blue,
        ),

         */
        // body: HomeScreen(),
        body: SendLunchSuccess(),
      ),
    );
  }
}
