import 'package:flutter/material.dart';
import 'package:hng_task3/screens/withdraw/withdraw_success_screen.dart';

import '../home/available_lunch.dart';

class WithdrawLunch extends StatefulWidget {
  const WithdrawLunch({super.key});

  @override
  State<WithdrawLunch> createState() => _WithdrawLunchState();
}

class _WithdrawLunchState extends State<WithdrawLunch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(0, 120, 98, 0.5),
                        Color.fromRGBO(43, 255, 178, 0.32),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const AvailableLunch()));
                                  },
                                ),
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(45, 0, 15, 0),
                                    child: Center(
                                      child: Text(
                                        'Withdraw Lunch',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: -0.2399999946,
                                        ),
                                      ),
                                    )),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: InkWell(
                                    child: Icon(
                                      Icons.file_copy,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const ListTile(
                        title: Text(
                          'Available Lunches For Withdrawal',
                          style: TextStyle(
                              fontSize: 24,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                        trailing: Wrap(
                          children: [Icon(Icons.info)],
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.04,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: const Center(
                          child: Text(
                            '34',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Convert Free Lunches Into Money',
                      style: TextStyle(fontSize: 23),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(233, 247, 242, 1),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.35,
                              child: const TextField(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'free lunches',
                                style:
                                TextStyle(color: Color.fromRGBO(4, 118, 78, 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Align(
                        child: SizedBox(
                          width: 167,
                          height: 20,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 1,
                                letterSpacing: -0.2399999946,
                                color: Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: ' ',
                                ),
                                TextSpan(
                                  text: '\$100.4 ',
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w700,
                                    height: 0.4166666667,
                                    letterSpacing: -0.2399999946,
                                    color: Color(0xff04764e),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Align(
                      child: Text(
                        '*By Clicking confirm, points would be coverted into your wallet as money. This process cannot be reversed as all points must be earned.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          height: 1.5,
                          color: Color(0xff4d4d4d),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 318,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xffe4b2a6),
                      ),
                      child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const WithdrawSuccessScreen()));
                            },
                            child: const Text(
                              'WITHDRAW LUNCH',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                color: Color(0xffffffff),
                              ),
                            ),
                          )),
                    ),
                  ],
                )
              ],
            )));
  }
}
