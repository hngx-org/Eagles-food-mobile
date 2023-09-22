import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

import 'package:hng_task3/widgets/send_lunch/send_lunch_textfield.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_success.dart';

class SendLunchScreen extends StatefulWidget {
  const SendLunchScreen({super.key});

  @override
  State<SendLunchScreen> createState() => _SendLunchScreenState();
}

class _SendLunchScreenState extends State<SendLunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.Green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorUtils.Green,
        elevation: 0,
        title: Text(
          'Send Lunch',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: Colors.white),
        ),
        leading: SizedBox(
          width: 50,
          height: 50,
          child: IconButton(
            padding: const EdgeInsets.only(left: 10),
            icon: Image.asset("assets/icons/icon-back.png"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Align(
        // heightFactor: MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Avatar
              Stack(
                children: [
                  Positioned(
                      bottom: 7,
                      right: 40,
                      child: Image.asset('assets/images/arrow.png')),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/man-avatar.png')),
                ],
              ),

              //Body
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(child: Image.asset('assets/images/handler.png')),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Brooklyn Simmons',
                        style: Theme.of(context).textTheme.displayMedium),
                    // style: Theme.of(context).textTheme.displayLarge,  ),

                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Band 4 Member',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey[700]),
                    ),
                    Text(
                      'Associate Creative Director',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Number of Free Lunch:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 9,
                    ),

                    //Free Lunch TextField

                    SendLunchTextField(
                      keyboardType: TextInputType.number,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                        child: Text('Free lunches',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: ColorUtils.Green)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Reward Reason:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),

                    const SizedBox(
                      height: 9,
                    ),

                    //Reward Reason TextField
                    SendLunchTextField(),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'By Clicking send lunch, you choose to reward recipient with the stipulated number of lunch',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey[700]),
                    ),
                    // Send Lunch Button
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(),
                              minimumSize: const Size.fromHeight(60),
                              backgroundColor: const Color(0xFF04754D)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SendLunchSuccess()));
                          },
                          child: const Text(
                            "SEND LUNCH",
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
        ),
      ),
    );
  }
}
