import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04764E),
      body: SafeArea(
        // TODO: Add all the extra glitter
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 105,
            vertical: 200,
          ),
          child: Image.asset("assets/images/splashscreen.png"),
        ),
      ),
    );
  }
}
