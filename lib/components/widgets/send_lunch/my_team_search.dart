import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_screen.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

class MyTeamSearch extends StatefulWidget {
  const MyTeamSearch({super.key, this.list});
  final list;
  // final String search;
  @override
  State<MyTeamSearch> createState() => _MyTeamSearchState();
}

class _MyTeamSearchState extends State<MyTeamSearch> {
  bool end_reached = false;
  int page = 1;
  bool isFetchingTeam = false;

  @override
  Widget build(BuildContext context) {
    isFetchingTeam = Provider.of<TeamAndLunchProvider>(context, listen: false)
        .isFetchingTeam;
    return Column(
      children: [
        widget.list.isEmpty
            ? ListView.builder(
                shrinkWrap: false,
                padding: const EdgeInsets.symmetric(vertical: 0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => const TeamShimmer())
            : NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  var metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    if (metrics.pixels == 0) {
                    } else {
                      setState(() {
                        end_reached = true;
                        page++;
                      });
                      Provider.of<TeamAndLunchProvider>(context, listen: false)
                          .getMyTeam(page, 'loading');
                    }
                  }
                  return true;
                },
                child: Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.list.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    itemBuilder: (context, index) {
                      final item = widget.list[index];
                      return SizedBox(
                          width: double.infinity,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(item.image),
                            ),
                            title: Text(
                              item.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              '${item.email}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11),
                            ),
                            trailing: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ColorUtils.Green
                                  : ColorUtils.Yellow,
                              child: TextButton(
                                onPressed: () {
                                  FocusManager.instance.primaryFocus
                                      ?.unfocus(); // dismiss keyboard if open
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SendLunchScreen(
                                                receiver: item,
                                              )));
                                },
                                child: Text(
                                  'Send Lunch',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13),
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ),
        if (isFetchingTeam)
          SizedBox(
            width: 30,
            height: 30,
            child: CupertinoActivityIndicator(
              color: ColorUtils.Green,
              radius: 15,
            ),
          )
      ],
    );
  }
}
