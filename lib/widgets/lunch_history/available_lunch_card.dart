import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_search.dart';
import 'package:hng_task3/screens/withdraw/withdraw_lunch.dart';
import 'package:hng_task3/widgets/custom_button.dart';

import '../../providers/num_of_free_lunch_provider.dart';

class AvailableLunchCard extends StatelessWidget {
  const AvailableLunchCard({Key? key, required this.numOfFreeLunchProvider})
      : super(key: key);
  final NumOfFreeLunchProvider numOfFreeLunchProvider;

  @override
  Widget build(BuildContext context) {
    final num = numOfFreeLunchProvider.numOfFreeLunch.isNotEmpty
        ? numOfFreeLunchProvider.numOfFreeLunch
        : '100';
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
                    trailing: const Wrap(
                      children: [Icon(Icons.info_outline)],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.04,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Text(
                      num,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WithdrawLunch(
                                      numOfFreeLunchProvider:
                                          numOfFreeLunchProvider)));
                        },
                        fontSize: 14,
                        buttonText: 'Withdraw lunch',
                        buttonColor: ColorUtils.DeepPink,
                        textColor: ColorUtils.Black,
                        padding: const EdgeInsets.all(16),
                      )),
                      const SizedBox(
                        width: 16,
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
