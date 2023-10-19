import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/lunchHistoryShimmer.dart';
import 'package:hng_task3/components/widgets/common/lunch_history_item.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
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

  bool end_reached = false;
  int page = 1;
  bool isFetchingLunchHistory = false;
  bool isLoadingHistory = false;


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
    isFetchingLunchHistory = Provider.of<TeamAndLunchProvider>(context).isFetchingLunchHistory;
    isLoadingHistory = Provider.of<TeamAndLunchProvider>(context).isLoadingHistory;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          isLoadingHistory
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          const LunchHistoryShimmer()),
                )
              : widget.history.isEmpty ?

              Center(
                child: Text("No lunch History available, be the first to send",
                style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
          :
          NotificationListener<ScrollEndNotification>(
                  onNotification: (scrollEnd) {
                    var metrics = scrollEnd.metrics;
                    if (metrics.atEdge) {
                      if (metrics.pixels != 0) {
                        setState(() {
                          end_reached = true;
                          page ++;
                        });
                        Provider.of<TeamAndLunchProvider>(context, listen: false)
                            .getLunchHistory(page, 'loading');
                      }
                    }
                    return true;
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: widget.limit != true ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    // itemCount: widget.history.length,
                    itemCount: widget.limit == true && filteredHistory.length > 5
                        ? 5
                        : filteredHistory.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: LaunchHistoryItem(
                        user: user,
                        lunchHistory: filteredHistory[index],
                      ),
                    ),
                  ),
                ),

          if (isFetchingLunchHistory && widget.limit != true)
            SizedBox(
              width: 25,
              height: 25,
              child: CupertinoActivityIndicator(
                color: ColorUtils.Green,
                radius: 15,
              ),
            )
        ],
      ),
    );
  }

  Future<void> _applyFilter() async {
    switch (selectedFilter) {
      case LunchHistoryFilters.All:
        filteredHistory = widget.history.toList();
        break;

      case LunchHistoryFilters.Received:
        filteredHistory = widget.history
            .where((element) => element.senderId.toString() != user?.id.toString())
            .toList();
        break;

      case LunchHistoryFilters.Sent:
        filteredHistory = widget.history
            .where((element) => element.senderId.toString() == user?.id.toString() && element.note != 'Lunch Withdrawal' )
            .toList();
        break;

      case LunchHistoryFilters.Withdrawal:
        filteredHistory = widget.history
            .where((element) => element.senderId.toString() == user?.id.toString() && element.note == 'Lunch Withdrawal' )
            .toList();
        break;
    }

    setState(() {});
  }
}
