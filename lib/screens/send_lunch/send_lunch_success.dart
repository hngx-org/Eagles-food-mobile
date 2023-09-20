import 'package:flutter/material.dart';

class SendLunchSuccess extends StatelessWidget {
  const SendLunchSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: Image.asset("assets/images/send-lunch-success.png")),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Column(
                  children: [
                    Text(
                      "Your Free Lunch has been sent successfully",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                      // TODO: Fix the spacing of the text widget.
                      child: Text(
                        "Congratulations, you have successfully sent brooklyn Simmons 3 Free Lunches! Click continue to proceed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),

                // Continue Button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 60),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: const Color(0xFF04754D)),
                      onPressed: () {},
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
      )),
    );
  }
}
