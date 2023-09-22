import 'package:flutter/material.dart';
import 'package:hng_task3/configs/theme.dart';
// import 'package:hng_task3/screens/home/home_screen.dart';
import 'package:hng_task3/screens/menu/components/nav_screen.dart';
// import 'package:hng_task3/screens/auth/auth_home.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_search.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: theme,
      home: const NavScreen(),
    );
  }
}
