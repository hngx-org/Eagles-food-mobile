import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

class LaunchHistoryItem extends StatelessWidget {
  const LaunchHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Exceptional Client Presentation',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorUtils.Green),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '+2',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorUtils.Green),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From Darrell Steward',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: ColorUtils.Grey),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      'June 18, 2020  |  4:00 AM',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.Grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Received Free Lunch',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorUtils.Grey),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
