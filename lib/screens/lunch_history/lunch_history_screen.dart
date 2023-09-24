import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/lunch_history/available_lunch_card.dart';
import 'package:hng_task3/widgets/lunch_history/lunch_history_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/num_of_free_lunch_provider.dart';

class LunchHistoryScreen extends StatefulWidget {
  const LunchHistoryScreen(
      {Key? key, this.numOfFreeLunchProvider, this.history})
      : super(key: key);
  final numOfFreeLunchProvider;
  final history;

  @override
  State<LunchHistoryScreen> createState() => _LunchHistoryScreenState();
}

class _LunchHistoryScreenState extends State<LunchHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final numOfFreeLunchProvider = Provider.of<NumOfFreeLunchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lunch History",
          style: TextStyle(
              fontSize: 20,
              fontFamily: "Stapel",
              color: ColorUtils.Black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AvailableLunchCard(
                  numOfFreeLunchProvider: numOfFreeLunchProvider,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LunchHistoryWidget(
                  limit: false,
                  history: widget.history,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
