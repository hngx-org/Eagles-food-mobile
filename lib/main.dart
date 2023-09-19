import 'package:flutter/material.dart';
import 'package:hng_task3/screens/home/home_screen.dart';
// import 'package:hng_task3/screens/withdraw/withdraw_success_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lunch app',
          ),
          backgroundColor: Colors.blue,
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
