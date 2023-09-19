import 'package:flutter/material.dart';

class SendLunchSuccess extends StatelessWidget {
  const SendLunchSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          // Spread out the widgets
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/send-lunch-success.png"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "Your Free Lunch has been sent successfully",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                    // Fix the spacing of the text widget.
                    child: Text(
                      "Congratulations, you have successfully sent brooklyn Simmons 3 Free Lunches! Click continue to proceed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 29, vertical: 60),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
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
            ],
          ),
        ),
      )),
    );
  }
}
