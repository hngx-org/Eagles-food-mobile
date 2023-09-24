import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/team_data.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_screen.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../providers/num_of_free_lunch_provider.dart';

class MyTeamSearch extends StatefulWidget {
  const MyTeamSearch({super.key, this.list});
  final list;
  @override
  State<MyTeamSearch> createState() => _MyTeamSearchState();
}

class _MyTeamSearchState extends State<MyTeamSearch> {
  @override
  Widget build(BuildContext context) {
    final numOfFreeLunchProvider = Provider.of<NumOfFreeLunchProvider>(context);
    return widget.list.length == 0
        ? Center(
            child: Utils.loading(),
          )
        : ListView.builder(
            itemCount: widget.list.length,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      '${item.email}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w500, fontSize: 11),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      color: ColorUtils.Yellow,
                      child: TextButton(
                        onPressed: () {
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
                                  fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                      ),
                    ),
                  ));
            },
          );
  }
}
