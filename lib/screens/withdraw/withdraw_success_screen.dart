import 'package:flutter/material.dart';
import 'package:hng_task3/screens/home/home_screen.dart';
import 'package:hng_task3/widgets/withdraw/withdraw_image.dart';

class WithdrawSuccessScreen extends StatelessWidget {
  const WithdrawSuccessScreen({super.key, required this.numOfFreeLunch});

  final String numOfFreeLunch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Column(
                children: [
                  const WithdrawImage(),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 28),
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Your Free Lunch has been Withdrawn',
                      style: TextStyle(
                          color: Color(0xFF1B1B1B),
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 28),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Congratulations, you have withdrawn $numOfFreeLunch Free Lunches. Click continue to proceed',
                      style: const TextStyle(
                          color: Color(0xFF1B1B1B),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'poppins'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 298,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF04764E),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(openDrawer: () {})));
                      },
                      child: const Text('CONTINUE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: 'poppins'),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 125,
                  left: -20,
                  child: SizedBox(
                    height: 24,
                    width: 430,
                    child: Image.asset('assets/images/wave_brown.png'),
                  )),
              Positioned(
                  bottom: 223,
                  right: -20,
                  child: SizedBox(
                    height: 150,
                    width: 112,
                    child:
                        Image.asset('assets/images/withdraw_vector_right.png'),
                  ))
            ]),
          ),
        ),
    );
  }
}
