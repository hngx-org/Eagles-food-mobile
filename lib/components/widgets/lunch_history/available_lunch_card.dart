import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_search.dart';
import 'package:hng_task3/screens/withdraw_lunch/withdraw_lunch.dart';

class AvailableLunchCard extends StatelessWidget {
  const AvailableLunchCard({Key? key, this.availableLunch}) : super(key: key);
  final availableLunch;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
            left: -16,
            bottom: -150,
            child: Image.asset('assets/images/line-vector.png')),
        Container(
          decoration: BoxDecoration(
            color: ColorUtils.Green,
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/withdrawal-bg.png',
                ),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: ColorUtils.Yellow,
                blurRadius: 0,
                offset: const Offset(7, 7),
                spreadRadius: 0,
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Available Lunches For\nWithdrawal',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: ColorUtils.White,
                          ),
                    ),
                    trailing: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      availableLunch ,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WithdrawLunch()));
                        },
                        fontSize: 14,
                        buttonText: 'Withdraw lunch',
                        buttonColor: ColorUtils.DeepPink,
                        textColor: ColorUtils.Black,
                        padding: const EdgeInsets.all(16),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SendLunchSearch()));
                        },
                        fontSize: 14,
                        buttonText: 'Send lunch',
                        buttonColor: ColorUtils.Yellow,
                        textColor: ColorUtils.Black,
                        padding: const EdgeInsets.all(16),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
