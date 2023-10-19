// place to see the leaderboard, who has giving the most amount of free lunch
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/leaderboardShimmer.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/components/widgets/leaderboard/leaderboard_widget.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/leaderboard.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen>
    with WidgetsBindingObserver {
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
  bool isFetchingLeaderboard = false;
  int page = 1;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      SessionManager ss = SessionManager();
      ss.setInitialFetchLeaderboard(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    leaderboard = Provider.of<TeamAndLunchProvider>(context).leaderboard;
    isLoading = Provider.of<TeamAndLunchProvider>(context).isLoading;
    leaderboard.sort((a, b) => b.quantity.compareTo(a.quantity));
    isFetchingLeaderboard =
        Provider.of<TeamAndLunchProvider>(context).isFetchingLeaderboard;

    List<LeaderBoard> filtered = leaderboard
        .where((team) =>
            team.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      // ignore: deprecated_member_use
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
      body: RefreshIndicator(
        displacement: 50,
        backgroundColor: ColorUtils.Green,
        color: ColorUtils.White,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          Provider.of<TeamAndLunchProvider>(context, listen: false)
              .getLeaderBoard(1);
          setState(() {
            isLoading = true;
          });
        },
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: ColorUtils.LightGrey),
                        ),
                      )
                    : NotificationListener<ScrollEndNotification>(
                        onNotification: (scrollEnd) {
                          var metrics = scrollEnd.metrics;
                          if (metrics.atEdge) {
                            if (metrics.pixels != 0) {
                              setState(() {
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
                              return LeaderBoardWidget(
                                  item: item, index: index);
                            },
                          ),
                        ),
                      ),
            if (isFetchingLeaderboard)
              SizedBox(
                width: 35,
                height: 35,
                child: CupertinoActivityIndicator(
                  color: ColorUtils.Green,
                  radius: 15,
                ),
              )
          ],
        ),
      ),
    );
  }
}
