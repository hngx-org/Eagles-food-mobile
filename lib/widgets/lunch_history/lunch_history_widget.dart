import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/lunch_history_model.dart';
import 'package:hng_task3/screens/lunch_history/lunch_history_screen.dart';
import 'package:hng_task3/widgets/common/lunch_history_item.dart';
import 'package:provider/provider.dart';

import '../../providers/num_of_free_lunch_provider.dart';

enum LunchHistoryFIlters { Received, Sent }

class LunchHistoryWidget extends StatefulWidget {
  const LunchHistoryWidget({Key? key, required this.limit, this.history}) : super(key: key);
  final bool limit;
  final history;

  @override
  State<LunchHistoryWidget> createState() => _LunchHistoryWidgetState();
}

class _LunchHistoryWidgetState extends State<LunchHistoryWidget> {
  var selectedFilter = LunchHistoryFIlters.Received;

  @override
  Widget build(BuildContext context) {
    final numOfFreeLunchProvider = Provider.of<NumOfFreeLunchProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lunch History",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 22),
                  ),
                  if (widget.limit)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LunchHistoryScreen(
                                numOfFreeLunchProvider: numOfFreeLunchProvider,
                              ),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'See more',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Stapel',
                              decoration: TextDecoration.underline,
                              color: ColorUtils.Green,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            DropdownButton<LunchHistoryFIlters>(
              icon: const Icon(Icons.arrow_drop_down),
              value: selectedFilter,
              underline: const SizedBox(),
              alignment: Alignment.center,
              iconEnabledColor: ColorUtils.Green,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorUtils.Green,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              items: LunchHistoryFIlters.values
                  .map((e) => DropdownMenuItem<LunchHistoryFIlters>(
                        value: e,
                        child: Text(
                          e.name,
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    selectedFilter = value;
                  }
                });
              },
            )
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.history.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: LaunchHistoryItem(
                lunchHistory: widget.history[index]),
          ),
        )
      ],
    );
  }
}
