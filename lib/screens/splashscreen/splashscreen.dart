import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/screens/menu/components/nav_screen.dart';
// import 'package:hng_task3/screens/auth/auth_home.dart';
import 'package:hng_task3/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateBasedOnSession();
  }

  void navigateBasedOnSession() async {
    SessionManager ss = SessionManager();
    bool isLoggedIn = await ss.getLogin();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => isLoggedIn ? const NavScreen() : const OnboardingScreen() ),
            (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04764E),
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
    );
  }
}
