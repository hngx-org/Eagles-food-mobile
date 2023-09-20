import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

class LunchActions extends StatelessWidget {
  const LunchActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorUtils.Green,
        boxShadow: [
          BoxShadow(
            color: ColorUtils.Yellow,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: const Offset(-10, 12.0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Withdraw Lunch')),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('Send Lunch'),
            ),
          ),
        ],
      ),
    );
  }
}
