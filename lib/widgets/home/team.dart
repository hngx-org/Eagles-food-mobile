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
    ),
    TeamData(
      senderfullName: 'Brooklyn Simmons',
      receiverfullName: 'Arlene McCoy',
    ),
    TeamData(
      senderfullName: 'Brooklyn Simmons',
      receiverfullName: 'Arlene McCoy',
    ),
    TeamData(
      senderfullName: 'Brooklyn Simmons',
      receiverfullName: 'Arlene McCoy',
    ),
    TeamData(
      senderfullName: 'Brooklyn Simmons',
      receiverfullName: 'Arlene McCoy',
    ),
    TeamData(
      senderfullName: 'Brooklyn Simmons',
      receiverfullName: 'Arlene McCoy',
    ),
    TeamData(
      senderfullName: 'Brooklyn Simmons',
      receiverfullName: 'Arlene McCoy',
    ),
    TeamData(
      senderfullName: 'Brooklyn Simmons',
      receiverfullName: 'Arlene McCoy',
    ),
    TeamData(
      senderfullName: 'Brooklyn Simmons',
      receiverfullName: 'Arlene McCoy',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('My Team'),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: _teamList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/team-1.png'),
              ),
              title: Text(_teamList[index].senderfullName),
              subtitle: Text('by ${_teamList[index].receiverfullName}'),
              trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: ColorUtils.Yellow,
                  child: const Text('Send Lunch')),
            );
          },
        )
      ],
    );
  }
}
