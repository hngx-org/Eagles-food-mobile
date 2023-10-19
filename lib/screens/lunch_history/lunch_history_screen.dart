import 'package:flutter/material.dart';
import 'package:hng_task3/components/widgets/lunch_history/available_lunch_card.dart';
import 'package:hng_task3/components/widgets/lunch_history/lunch_history_widget.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class LunchHistoryScreen extends StatefulWidget {
  LunchHistoryScreen(
      {Key? key, this.history, this.user})
      : super(key: key);
  final history;
  var user;
  @override
  State<LunchHistoryScreen> createState() => _LunchHistoryScreenState();
}

class _LunchHistoryScreenState extends State<LunchHistoryScreen> {

  User? user;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    return Scaffold(
      backgroundColor:  Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/icons/icon-back.png",
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Lunch History",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AvailableLunchCard(
                  availableLunch: widget.user.lunchCreditBalance ,
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
