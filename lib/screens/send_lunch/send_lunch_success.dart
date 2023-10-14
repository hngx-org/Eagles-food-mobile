import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/home/menu/nav_screen.dart';

class SendLunchSuccess extends StatelessWidget {
  final String noOfLunches;
  const SendLunchSuccess({super.key, required this.noOfLunches});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).backgroundColor,

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 293,
                        height: 284,
                        child: Stack(
                          children: [
                            Positioned(
                                top: 153,
                                left: 62,
                                child: SizedBox(
                                  height: 9,
                                  width: 9,
                                  child: Image.asset(
                                      'assets/images/plus_green.png'),
                                )),
                            Positioned(
                                top: 135,
                                left: 283,
                                child: SizedBox(
                                  height: 9,
                                  width: 9,
                                  child: Image.asset(
                                      'assets/images/plus_green.png'),
                                )),
                            Positioned(
                                top: 374,
                                left: 320,
                                child: SizedBox(
                                  height: 9,
                                  width: 9,
                                  child: Image.asset(
                                      'assets/images/plus_green.png'),
                                )),
                            Positioned(
                                top: 385,
                                left: 300,
                                child: SizedBox(
                                  height: 9,
                                  width: 9,
                                  child: Image.asset(
                                      'assets/images/circle_green.png'),
                                )),
                            Positioned(
                                left: 50,
                                child: SizedBox(
                                  height: 9,
                                  width: 9,
                                  child: Image.asset(
                                      'assets/images/minus_green.png'),
                                )),
                            Positioned(
                                right: 20,
                                top: 50,
                                child: SizedBox(
                                  height: 9,
                                  width: 9,
                                  child: Image.asset(
                                      'assets/images/minus_green.png'),
                                )),
                          ],
                        ),
                      ),
                      Image.asset("assets/images/send-lunch-success.png"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          // Free Lunch Text
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                                "Your Free Lunch has been sent successfully",
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Center(
                              child: Text(
                                "Congratulations, you have successfully sent $noOfLunches ${noOfLunches == '1' ? 'free lunch' : 'free lunches'}! Tap continue to proceed",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: CustomButton(
                            onPress: () async {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const NavScreen()),
                                  (route) => false);
                            },
                            buttonText: "Continue",
                            buttonColor: ColorUtils.Green,
                            textColor: ColorUtils.White,
                            isUppercase: true),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
