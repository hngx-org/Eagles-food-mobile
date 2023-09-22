import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/lunch_history_model.dart';
import 'package:hng_task3/screens/lunch_history/lunch_history_screen.dart';
import 'package:hng_task3/widgets/common/lunch_history_item.dart';

enum LunchHistoryFIlters { Received, Sent }

class LunchHistoryWidget extends StatefulWidget {
  const LunchHistoryWidget({Key? key}) : super(key: key);

  @override
  State<LunchHistoryWidget> createState() => _LunchHistoryWidgetState();
}

class _LunchHistoryWidgetState extends State<LunchHistoryWidget> {
  var selectedFilter = LunchHistoryFIlters.Received;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LaunchHistoryScreen(),
                      ));
                },
                child: Text(
                  "Lunch History",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Stapel",
                      color: ColorUtils.Black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<LunchHistoryFIlters>(
                icon: const Icon(Icons.arrow_drop_down),
                value: selectedFilter,
                underline: const SizedBox(),
                alignment: Alignment.center,
                iconEnabledColor: ColorUtils.Green,
                style: TextStyle(
                    color: ColorUtils.Green,
                    fontSize: 16,
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
              ),
            )
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: LunchHistoryModel.dummyHistory.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: LaunchHistoryItem(
                lunchHistory: LunchHistoryModel.dummyHistory[index]),
          ),
        )
      ],
    );
  }
}
