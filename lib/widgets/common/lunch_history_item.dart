import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/lunch_history_model.dart';

class LaunchHistoryItem extends StatelessWidget {
  const LaunchHistoryItem({Key? key, required this.lunchHistory})
      : super(key: key);
  final LunchHistoryModel lunchHistory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                lunchHistory.reason.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              lunchHistory.amountTittle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color:
                      lunchHistory.isReceived ? ColorUtils.Green : Colors.red),
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
                    lunchHistory.senderOrReceiverTittle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: ColorUtils.Grey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
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
                lunchHistory.subtittle,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.Grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
