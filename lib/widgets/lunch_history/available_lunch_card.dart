import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/custom_button.dart';

class AvailableLunchCard extends StatelessWidget {
  const AvailableLunchCard({Key? key}) : super(key: key);

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
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(color: ColorUtils.White,),
                    ),
                    trailing:const Wrap(
                      children: [Icon(Icons.info)],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),

                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.04,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Text(
                      '34',
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
                        onPress: () {},
                        fontSize: 14,
                        buttonText: 'withdraw lunch',
                        buttonColor: ColorUtils.EbaTan,
                        textColor: ColorUtils.Black,
                        padding: const EdgeInsets.all(16),
                      )),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: CustomButton(
                        onPress: () {},
                        fontSize: 14,
                        buttonText: 'send lunch',
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
