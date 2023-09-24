import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/team_data.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_screen.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/num_of_free_lunch_provider.dart';

class TeamList extends StatefulWidget {
  const TeamList({super.key, this.list});
  final list;
  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    final numOfFreeLunchProvider = Provider.of<NumOfFreeLunchProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Team',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        widget.list.length == 0
            ? Center(
                child: Utils.loading(),
              )
            : ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 0),
                physics: const BouncingScrollPhysics(),
                itemCount: widget.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: double.infinity,
                    child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(widget.list[index].image),
                        ),
                        title: Text(widget.list[index].name),
                        subtitle: Text(
                          '${widget.list[index].email}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 10),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          color: ColorUtils.Yellow,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => SendLunchScreen(
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
