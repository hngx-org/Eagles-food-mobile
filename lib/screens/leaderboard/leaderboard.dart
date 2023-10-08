// place to see the leaderboard, who has giving the most amount of free lunch
import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/leaderboard.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
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
    Provider.of<TeamAndLunchProvider>(context, listen: false).getLeaderBoard();
    super.initState();
  }

  List<LeaderBoard> filtered = [];
  List<LeaderBoard> leaderboard = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    leaderboard = Provider.of<TeamAndLunchProvider>(context).leaderboard;
    isLoading = Provider.of<TeamAndLunchProvider>(context).isLoading;

    List<LeaderBoard> filtered = leaderboard
        .where((team) =>
        team.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
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
            Text(
              "Send an invite for someone to join your team",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: ColorUtils.LightGrey),
            ),
            isLoading
                ? ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 0),
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => const TeamShimmer())
                :
            filtered.isEmpty ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "No member found",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: ColorUtils.LightGrey),
              ),
            ) :
            ListView.builder(
              itemCount: filtered.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                final item = filtered[index];
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
