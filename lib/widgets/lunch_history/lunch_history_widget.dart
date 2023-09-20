import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/common/lunch_history_item.dart';

class LunchHistoryWidget extends StatefulWidget {
  const LunchHistoryWidget({Key? key}) : super(key: key);

  @override
  State<LunchHistoryWidget> createState() => _LunchHistoryWidgetState();
}

class _LunchHistoryWidgetState extends State<LunchHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Lunch History",
                style: TextStyle(fontSize: 20, color: ColorUtils.Black),
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(foregroundColor: ColorUtils.Green),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'Newest',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: ColorUtils.Green),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.all(8.0),
            child: LaunchHistoryItem(),
          ),
        ))
      ],
    );
  }
}
