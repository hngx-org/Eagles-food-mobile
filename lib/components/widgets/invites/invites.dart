import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
class Invitations extends StatelessWidget {
  const Invitations({super.key, this.invite});
 final invite;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorUtils.LightGrey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 0.5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(invite['team'],
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  "Sent by ${invite['sender']}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorUtils.Green,
                    fontWeight: FontWeight.w500
                  ),
                )

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomButton(
                  onPress: () {

                  },
                  buttonText: "Accept",
                  buttonColor: ColorUtils.Green,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  textColor: ColorUtils.White,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CustomButton(
                  onPress: () {

                  },
                  buttonText: "Decline",
                  buttonColor: ColorUtils.Red,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  textColor: ColorUtils.White,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
