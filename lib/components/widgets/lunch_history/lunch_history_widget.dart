import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/lunchHistoryShimmer.dart';
import 'package:hng_task3/components/widgets/common/lunch_history_item.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/lunch_history/lunch_history_screen.dart';
import 'package:provider/provider.dart';

enum LunchHistoryFilters { All, Received, Sent, Withdrawal }

class LunchHistoryWidget extends StatefulWidget {
  const LunchHistoryWidget(
      {Key? key, required this.limit, required this.history})
      : super(key: key);
  final bool limit;
  final List<Lunch> history;

  @override
  State<LunchHistoryWidget> createState() => _LunchHistoryWidgetState();
}

class _LunchHistoryWidgetState extends State<LunchHistoryWidget> {
  var filteredHistory = [];
  var selectedFilter = LunchHistoryFilters.All;
  User? user;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _applyFilter();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
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
                        ?.copyWith(fontSize: 21, fontWeight: FontWeight.w400),
                  ),
                  if (widget.limit)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LunchHistoryScreen(
                                user: user,
                                history: widget.history,
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

            // Filter Button
            DropdownButton<LunchHistoryFilters>(
              icon: const Icon(Icons.arrow_drop_down),
              value: selectedFilter,
              underline: const SizedBox(),
              alignment: Alignment.center,
              iconEnabledColor: ColorUtils.Green,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorUtils.Green,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              items: LunchHistoryFilters.values
                  .map((e) => DropdownMenuItem<LunchHistoryFilters>(
                        value: e,
                        child: Text(
                          e.name,
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  selectedFilter = value;
                }
                _applyFilter();
              },
            )
          ],
        ),
        widget.history.isEmpty ? ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 0),
            physics: const BouncingScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, index) => const LunchHistoryShimmer()
        ) : ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          // itemCount: widget.history.length,
          itemCount: widget.limit ==true && filteredHistory.length > 5 ? 5 : filteredHistory.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: LaunchHistoryItem(
              lunchHistory: filteredHistory[index],
            ),
          ),
        )
      ],
    );
  }

  Future<void> _applyFilter() async {

    switch (selectedFilter) {
      case LunchHistoryFilters.All:
        filteredHistory = widget.history.toList();
        break;

      case LunchHistoryFilters.Received:
        filteredHistory = widget.history
            .where((element) => element.lunchStatus == 1)
            .toList();
        break;

      case LunchHistoryFilters.Sent:
        filteredHistory = widget.history
            .where((element) => element.lunchStatus == 0)
            .toList();
        break;

      case LunchHistoryFilters.Withdrawal:
        filteredHistory = widget.history
            .where((element) => element.lunchStatus == 2)
            .toList();
        break;
    }

    setState(() {});
  }
}
