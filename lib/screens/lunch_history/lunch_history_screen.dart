import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/lunch_history/available_lunch_card.dart';
import 'package:hng_task3/widgets/lunch_history/lunch_history_widget.dart';

class LaunchHistoryScreen extends StatefulWidget {
  const LaunchHistoryScreen({Key? key}) : super(key: key);

  @override
  State<LaunchHistoryScreen> createState() => _LaunchHistoryScreenState();
}

class _LaunchHistoryScreenState extends State<LaunchHistoryScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: AvailableLunchCard(),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: LunchHistoryWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
