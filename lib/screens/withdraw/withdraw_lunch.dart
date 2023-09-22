

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:hng_task3/screens/withdraw/withdraw_success_screen.dart';

class WithdrawLunch extends StatefulWidget {
  const WithdrawLunch({super.key});

  @override
  State<WithdrawLunch> createState() => _WithdrawLunchState();
}

class _WithdrawLunchState extends State<WithdrawLunch> {
  TextEditingController controller = TextEditingController();
  double convertedValue = 0;
  double amount = 0;

  void convertValueToDouble() {
    final text = controller.text.trim();

    if (text.isNotEmpty) {
      setState(() {
        convertedValue = double.parse(text);
        amount = convertedValue * 2.008;
      });
    } else {
      setState(() {
        convertedValue = 0;
        amount = 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(convertValueToDouble);
  }

  @override
  void dispose() {
    controller.removeListener(convertValueToDouble);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: 407,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFF04764E),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -30,
                          right: -100,
                          child: Transform.rotate(
                            angle: -math.pi / 108,
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color(0xFF007862).withOpacity(0.5),
                              radius: 150,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: -80,
                          child: CircleAvatar(
                            backgroundColor:
                                const Color(0xFF036442).withOpacity(0.7),
                            radius: 130,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 75,
                          child: Container(
                            color: const Color(0xFFEFCE82),
                            height: 100,
                            width: MediaQuery.of(context).size.width - 16,
                          ),
                        ),
                        Positioned(
                            right: 110,
                            left: 90,
                            bottom: 215,
                            child: SizedBox(
                                height: 9,
                                width: 9,
                                child: Image.asset(
                                    'assets/images/withdraw_circle.png'))),
                        Positioned(
                            right: 90,
                            left: 110,
                            bottom: 200,
                            child: SizedBox(
                                height: 9,
                                width: 9,
                                child: Image.asset(
                                    'assets/images/withdraw_plus.png'))),
                        Positioned(
                            right: 40,
                            bottom: 250,
                            child: SizedBox(
                                height: 9,
                                width: 9,
                                child: Image.asset(
                                    'assets/images/withdraw_circle.png'))),
                        Positioned(
                            right: 50,
                            bottom: 50,
                            child: SizedBox(
                                height: 240,
                                width: 115,
                                child: Image.asset(
                                    'assets/images/withdraw_flower.png'))),
                        Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        width: 46,
                                        height: 46,
                                        child: Image.asset(
                                            'assets/images/withdraw_back_button.png'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Withdraw Lunch',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Stapel Semi Expanded',
                                          decoration: TextDecoration.none),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.bookmark_border,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  height: 54,
                                  width: 222,
                                  child: const Text(
                                    'Available Lunches for withdrawal',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    '34',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 55,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 580,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Stack(children: [
                        Positioned(
                            left: -10,
                            bottom: 270,
                            child: SizedBox(
                                height: 135,
                                width: 96,
                                child: Image.asset(
                                    'assets/images/withdraw_vector_left.png'))),
                        Positioned(
                            right: -20,
                            bottom: 150,
                            child: SizedBox(
                                height: 150,
                                width: 110,
                                child: Image.asset(
                                    'assets/images/withdraw_vector_right.png'))),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 6,
                            width: 60,
                            margin: const EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                              color: const Color(0xFFDDDDDD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                height: 56,
                                width: 255,
                                child: const Text(
                                  'Convert Free Lunches to money',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                height: 40,
                                width: 262,
                                child: const Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF4E4E4E),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 310,
                          top: 200,
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(52)),
                            color: const Color(0xFFE9F7F2),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 60,
                              height: 67,
                              child: Center(
                                child: TextField(
                                  controller: controller,
                                  textAlign: TextAlign.center,
                                  cursorColor: const Color(0xFF04764E),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      fontFamily: 'poppins'),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      suffix: Text(
                                        'Free Lunches',
                                        style: TextStyle(
                                            color: Color(0xFF04764E),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: 'poppins'),
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      hintText: ''),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 210,
                          left: 110,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20,
                                width: 15,
                                child: Image.asset(
                                    'assets/images/withdraw_equal.png'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "\$"'$amount',
                                style: const TextStyle(
                                    color: Color(0xFF04764E),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 48,
                                    fontFamily: 'poppins'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 100,
                          child: InkWell(
                            onTap: () {
                              controller.text.isNotEmpty?
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WithdrawSuccessScreen(numOfFreeLunch: controller.text,))):ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Color(0xFFEFCE82),
                                  content: Text('Enter number of free lunches you want to withdraw first'),
                                ),
                              );;
                            },
                            child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 30),
                              height: 60,
                              width: MediaQuery.of(context).size.width - 60,
                              color: const Color(0xFFE4B2A6),
                              child: const Center(
                                child: Text('WITHDRAW LUNCH',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        fontFamily: 'poppins')),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 170,
                          child: Container(
                            margin: const EdgeInsets.only(left: 30),
                            height: 45,
                            width: 319,
                            child: const Text(
                              '*By Clicking confirm, points would be converted into your wallet as money. This process cannot be reversed as all points must be earned',
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF4E4E4E),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins',
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 95,
                            left: -20,
                            child: SizedBox(
                              height: 24,
                              width: 400,
                              child: Image.asset(
                                  'assets/images/withdraw_wave.png'),
                            ))
                      ]),
                    ),
                  ),



                ],
              )),
        ),
      ),
    ));
  }
}

