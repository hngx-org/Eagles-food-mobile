import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/team_data.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/num_of_free_lunch_provider.dart';

class EveryoneSearch extends StatefulWidget {
  const EveryoneSearch({super.key});

  @override
  State<EveryoneSearch> createState() => _EveryoneSearchState();
}

class _EveryoneSearchState extends State<EveryoneSearch> {
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
    final numOfFreeLunchProvider = Provider.of<NumOfFreeLunchProvider>(context);

    return Column(
      children: _teamList.map((item) {
        return SizedBox(
            width: double.infinity,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundImage: AssetImage(item.image),
              ),
              title: Text(item.senderfullName),
              subtitle: Text('by ${item.receiverfullName}'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                color: ColorUtils.Yellow,
                child: TextButton(
                  onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>
                           SendLunchScreen(numOfFreeLunchProvider: numOfFreeLunchProvider,)));
                 
                  },
                  child: Text(
                    'Send Lunch',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                ),
              ),
            ));
      }).toList(),
    );
  }
}
