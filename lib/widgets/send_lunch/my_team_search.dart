import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
// import 'package:hng_task3/widgets/custom_button.dart';
import 'package:hng_task3/models/team_data.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_screen.dart';

class MyTeamSearch extends StatefulWidget {
  const MyTeamSearch({super.key});

  @override
  State<MyTeamSearch> createState() => _MyTeamSearchState();
}

class _MyTeamSearchState extends State<MyTeamSearch> {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SendLunchScreen()));
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
