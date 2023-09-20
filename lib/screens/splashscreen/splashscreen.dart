import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hng_task3/screens/auth/auth_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AuthHome()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04764E),
      body: Scaffold(
        // TODO: Add all the extra glitter
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splashscreen-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(
            "assets/logo/logo_white.png",
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
