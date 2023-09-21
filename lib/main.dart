import 'package:flutter/material.dart';
import 'package:hng_task3/configs/theme.dart';
import 'package:hng_task3/screens/auth/auth_home.dart';
import 'package:hng_task3/screens/menu/menu_screen.dart';
import 'package:hng_task3/screens/splashscreen/splashscreen.dart';

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
      home: const MenuScreen(),
    );
  }
}
