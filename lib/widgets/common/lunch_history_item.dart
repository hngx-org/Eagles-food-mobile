import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/extensions/date_extension.dart';
import 'package:hng_task3/extensions/lunch_extension.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/widgets/lunch_history/dynamic_color_text.dart';

class LaunchHistoryItem extends StatefulWidget {
  const LaunchHistoryItem({Key? key, required this.lunchHistory})
      : super(key: key);

  final Lunch lunchHistory;

  @override
  State<LaunchHistoryItem> createState() => _LaunchHistoryItemState();
}

class _LaunchHistoryItemState extends State<LaunchHistoryItem> {
  var user;
  bool isReceived = false;

  @override
  void initState() {
    widget.lunchHistory.isReceived().then((received) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          isReceived = received;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.lunchHistory);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                // Changed the overhead text widget
                child: Text(
              widget.lunchHistory.note.toUpperCase(),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ColorUtils.Black),
            )
                // child: DynamicColorText(
                //     text: widget.lunchHistory.note.toUpperCase(),
                //     // dynamicColor:
                //     //     lunchHistory. ? ColorUtils.Green : Colors.red),
                //     dynamicColor: isReceived ? ColorUtils.Green : Colors.red),
                ),
            const SizedBox(
              width: 35,
            ),
            Text(
              "${isReceived ? "+" : "-"} ${widget.lunchHistory.quantity.toString()}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: isReceived ? ColorUtils.Green : Colors.red),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getSubTittle(),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500, color: ColorUtils.Grey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${DateTime.parse(widget.lunchHistory.createdAt).formatToDate} |  ${DateTime.parse(widget.lunchHistory.createdAt).formatToTime}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorUtils.LightGrey),
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
                "${isReceived ? "Received" : "Sent"} Free Lunch",
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

  String _getSubTittle() {
    var subtittle = isReceived
        ? "FROM ${widget.lunchHistory.senderName}"
        : "TO ${widget.lunchHistory.receiverName}";

    return subtittle;
  }
}
