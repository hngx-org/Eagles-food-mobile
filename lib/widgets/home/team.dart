import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/team_data.dart';

class TeamList extends StatefulWidget {
  const TeamList({super.key});

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  final List<TeamData> _teamList = [
    TeamData(
        senderfullName: 'Leslie Alexander',
        receiverfullName: 'Darrell Steward',
        image: 'assets/images/team-1.png'),
    TeamData(
        senderfullName: 'Brooklyn Simmons',
        receiverfullName: 'Arlene McCoy',
        image: 'assets/images/team-2.png'),
    TeamData(
        senderfullName: 'Emmanuel Simmons',
        receiverfullName: 'Arlene McCoy',
        image: 'assets/images/team-3.png'),
  ];

  @override
  Widget build(BuildContext context) {
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
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: _teamList.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: double.infinity,
              child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_teamList[index].image),
                  ),
                  title: Text(_teamList[index].senderfullName),
                  subtitle: Text('by ${_teamList[index].receiverfullName}'),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    color: ColorUtils.Yellow,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Send Lunch',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 13),
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
