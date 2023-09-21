import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/custom_button.dart';

import '../../screens/withdraw/withdraw_lunch.dart';

class LunchActions extends StatelessWidget {
  const LunchActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorUtils.Green,
        image: const DecorationImage(
          image: AssetImage("assets/images/withdrawal-bg.png"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorUtils.Yellow,
            // blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: const Offset(7, 7.0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Expanded(
            child: CustomButton(onPress: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WithdrawLunch()));
            },
            buttonText: "Withdraw Lunch", buttonColor: ColorUtils.DeepPink, fontSize: 15 , textColor: ColorUtils.Black, padding:  const EdgeInsets.symmetric(vertical:15, horizontal: 10),
            ),
          ),

          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: CustomButton(onPress: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WithdrawLunch()));
            },
              buttonText: "Send Lunch", buttonColor: ColorUtils.Yellow, fontSize: 15 , textColor: ColorUtils.Black, padding:  const EdgeInsets.symmetric(vertical:15, horizontal: 10),
            ),
          ),

        ],
      ),
    );
  }
}
