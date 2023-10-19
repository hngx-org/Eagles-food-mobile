import 'package:flutter/material.dart';
import 'package:hng_task3/components/widgets/lunch_history/dynamic_color_text.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/utils/date_extension.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/utils/lunch_extension.dart';

class LaunchHistoryItem extends StatefulWidget {
  const LaunchHistoryItem({Key? key, required this.lunchHistory, this.user})
      : super(key: key);

  final user;
  final Lunch lunchHistory;

  @override
  State<LaunchHistoryItem> createState() => _LaunchHistoryItemState();
}

class _LaunchHistoryItemState extends State<LaunchHistoryItem> {


  String isLunchReceived() {
    if(widget.lunchHistory.senderId.toString() == widget.user.id.toString() && widget.lunchHistory.note != 'Lunch Withdrawal' ){
      return 'sent';
    }else if(widget.lunchHistory.senderId.toString() != widget.user.id.toString() && widget.lunchHistory.note != 'Lunch Withdrawal'){
      return 'received';
    }else{
      return 'withdrawn';
    }
  }

  @override
  void initState() {
    // widget.lunchHistory.isLunchReceived()().then((received) {
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     setState(() {
    //       isReceived = received;
    //     });
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print("${widget.lunchHistory.senderId}, ${widget.user.id} , ${widget.lunchHistory.note}");
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DynamicColorText(
                  text: widget.lunchHistory.note.toUpperCase(),
                  dynamicColor: isLunchReceived() == 'received' ? ColorUtils.Green :  isLunchReceived() == 'sent' ?  Colors.red : ColorUtils.Yellow),
            ),
            const SizedBox(
              width: 35,
            ),
            Text(
              "${isLunchReceived() == 'received' ? "+" : isLunchReceived() == 'sent' ? "-" : ''} ${widget.lunchHistory.quantity.toString()}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: isLunchReceived() == 'received' ? ColorUtils.Green :  isLunchReceived() == 'sent' ?  Colors.red : ColorUtils.Yellow ),
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
                "${isLunchReceived() == 'received' ? "Received" : isLunchReceived() == 'sent' ?  "Sent" : 'Withdrawn' } Lunch",
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
    var subtittle = isLunchReceived() == 'received'
        ? "From ${widget.lunchHistory.senderName}"
        : "To ${widget.lunchHistory.receiverName}";

    return subtittle;
  }
}
