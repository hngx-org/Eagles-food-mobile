// place to see the leaderboard, who has giving the most amount of free lunch
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/leaderboardShimmer.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/components/widgets/leaderboard/leaderboard_widget.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/leaderboard.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<TeamAndLunchProvider>(context, listen: false)
        .getLeaderBoard(page);
    super.initState();
  }

  List<LeaderBoard> filtered = [];
  List<LeaderBoard> leaderboard = [];
  List<LeaderBoard> ranked = [];
  bool isLoading = false;
  bool end_reached = false;
  bool isFetchingLeaderboard = false;
  int page = 1;

  @override
  Widget build(BuildContext context) {
    leaderboard = Provider.of<TeamAndLunchProvider>(context).leaderboard;
    isLoading = Provider.of<TeamAndLunchProvider>(context).isLoading;
    leaderboard.sort((a, b) => b.quantity.compareTo(a.quantity));
    isFetchingLeaderboard = Provider.of<TeamAndLunchProvider>(context).isFetchingLeaderboard;

    List<LeaderBoard> filtered = leaderboard
        .where((team) =>
            team.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "LeaderBoard",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child:
                // Search bar
                TextFormField(
              controller: searchController,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                hintText: 'Search LeaderBoard',
                filled: true,
                fillColor:
                    Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorUtils.LightGrey, fontWeight: FontWeight.w500),
                suffixIcon: Icon(
                  Icons.search,
                  color: ColorUtils.LightGrey,
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorUtils.LightGrey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorUtils.LightGrey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorUtils.LightGrey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          isLoading
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          const LeaderBoardShimmer()),
                )
              : filtered.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Leaderboard Empty, Be the first to send a lunch",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorUtils.LightGrey),
                      ),
                    )
                  : NotificationListener<ScrollEndNotification>(
                      onNotification: (scrollEnd) {
                        var metrics = scrollEnd.metrics;
                        if (metrics.atEdge) {
                          if (metrics.pixels == 0) {
                              setState(() {
                                end_reached = false;
                                print("not end");
                              });
                          }
                          if(metrics.pixels != 0) {
                            print("end reached");
                            setState(() {
                              end_reached = true;
                              page++;
                            });
                            Provider.of<TeamAndLunchProvider>(context,
                                    listen: false)
                                .getLeaderBoard(page);
                          }
                        }
                        return true;
                      },
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: filtered.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          itemBuilder: (context, index) {
                            final item = filtered[index];
                            return LeaderBoardWidget(item: item, index: index);
                          },
                        ),
                      ),
                    ),

                  if (isFetchingLeaderboard)
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: CupertinoActivityIndicator(
                        color: ColorUtils.Blue,
                        radius: 15,
                      ),
                    )
        ],
      ),
    );
  }
}
