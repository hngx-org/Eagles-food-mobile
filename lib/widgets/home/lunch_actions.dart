import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/custom_button.dart';

class LunchActions extends StatelessWidget {
  const LunchActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorUtils.Green),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CustomButton(
                onPress: () {},
                buttonText: "Withdraw Lunch",
                buttonColor: ColorUtils.Pink,
                textColor: ColorUtils.Black,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CustomButton(
                onPress: () {},
                buttonText: "Send Lunch",
                buttonColor: ColorUtils.Yellow,
                textColor: ColorUtils.Black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
