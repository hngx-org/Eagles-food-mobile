import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/onboarding/auth/auth_home.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/hotdog.png", height: 300, width: 300, fit: BoxFit.contain),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30.0, vertical: 20),
              child: Text(
                "Send Free Lunch to appreciate someone at work",
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Rewarding someone in the office has never been this easy, create a more productive and compensating work space with free lunches.",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20, top: 80),
              child: CustomButton(
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthHome(),
                      ));
                },
                buttonColor: ColorUtils.Green,
                buttonText: "Next",
                isUppercase: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
