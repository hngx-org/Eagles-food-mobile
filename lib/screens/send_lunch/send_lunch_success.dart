import 'package:flutter/material.dart';
import 'package:hng_task3/screens/home/home_screen.dart';
import 'package:hng_task3/screens/menu/components/nav_screen.dart';

class SendLunchSuccess extends StatelessWidget {
  const SendLunchSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Image
                Center(
                  child: Stack(
                    children: [
                      Container(
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
                      const Column(
                        children: [
                          // Free Lunch Text
                          Text(
                            "Your Free Lunch has been sent successfully",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 28, vertical: 12),
                            // TODO: Fix the spacing of the text widget.
                            child: Center(
                              child: Text(
                                "Congratulations, you have successfully sent brooklyn Simmons 3 Free Lunches! Click continue to proceed",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Continue Button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 29, vertical: 60),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                minimumSize: const Size.fromHeight(50),
                                backgroundColor: const Color(0xFF04754D)),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const NavScreen()));
                            },
                            child: const Text(
                              "CONTINUE",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 433,
                right: -20,
                child: SizedBox(
                  height: 150,
                  width: 112,
                  child: Image.asset('assets/images/withdraw_vector_right.png'),
                ))
          ],
        ),
      ),
    );
  }
}
