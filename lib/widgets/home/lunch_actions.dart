import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

class LunchActions extends StatelessWidget {
  const LunchActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorUtils.Green,
        boxShadow: [
          BoxShadow(
            color: ColorUtils.Yellow,
            // blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: const Offset(10, 12.0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorUtils.Yellow)),
                child: Text(
                  'Withdraw Lunch',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 10),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorUtils.Yellow)),
                child: const Text('Send Lunch'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
