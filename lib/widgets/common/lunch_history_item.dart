import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/lunch_history_model.dart';
import 'package:hng_task3/widgets/lunch_history/dynamic_color_text.dart';

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
              child: DynamicColorText(
                  text: lunchHistory.reason.toUpperCase(),
                  dynamicColor:
                      lunchHistory.isReceived ? ColorUtils.Green : Colors.red),
            ),
            const SizedBox(
              width: 35,
            ),
            Text(
              lunchHistory.amountTittle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ColorUtils.LightGrey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'June 18, 2020  |  4:00 AM',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
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
