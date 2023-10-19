import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_screen.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

class TeamList extends StatefulWidget {
  const TeamList({super.key, this.list});
  final list;
  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    isLoading = Provider.of<TeamAndLunchProvider>(context).isLoadingTeam;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Team',
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 21, fontWeight: FontWeight.w400),
        ),
        isLoading
            ? ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 0),
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => const TeamShimmer())
            : widget.list.isEmpty
                ? const Center(child: Text('No Team Members'))
                : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: min(5, widget.list.length),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: double.infinity,
                        child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage(widget.list[index].image),
                            ),
                            title: Text(
                              widget.list[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              '${widget.list[index].email}',
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
                              // color: ColorUtils.Yellow,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? ColorUtils.Green
                                  : ColorUtils.Yellow,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              SendLunchScreen(
                                                receiver: widget.list[index],
                                              ))));
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
                            )),
                      );
                    },
                  )
      ],
    );
  }
}
