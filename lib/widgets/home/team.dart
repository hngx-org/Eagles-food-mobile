import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/team_data.dart';
import 'package:hng_task3/widgets/custom_button.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     const Text('My Team'),
    //     const SizedBox(
    //       height: 20,
    //     ),
    //     Column(
    //       children: [
    //         Row(
    //           children: [
    //             const CircleAvatar(
    //               child: Image(image: AssetImage('assets/images/team-1.png')),
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             const Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text('Leslie Alexander'),
    //                   Text('by Darrell Steward')
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 10,
    //               ),
    //               color: ColorUtils.Yellow,
    //               child: CustomButton(
    //                 onPress: () {},
    //                 buttonText: "Send Lunch",
    //                 buttonColor: ColorUtils.Yellow,
    //                 textColor: ColorUtils.Black,
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 20,
    //         ),
    //         Row(
    //           children: [
    //             const CircleAvatar(
    //               child: Image(image: AssetImage('assets/images/team-1.png')),
    //             ),
    //             const SizedBox(
    //               width: 10,
    //             ),
    //             const Expanded(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text('Leslie Alexander'),
    //                   Text('by Darrell Steward')
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 10,
    //               ),
    //               color: ColorUtils.Yellow,
    //               child: CustomButton(
    //                 onPress: () {},
    //                 buttonText: "Send Lunch",
    //                 buttonColor: ColorUtils.Yellow,
    //                 textColor: ColorUtils.Black,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     )
    //   ],
    // );

    return ListView.builder(
      itemCount: _teamList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/team-1.png'),
                  ),
                  // title: Text(_teamList[index].senderfullName),
                  title: const Text('Hello'),
                  subtitle: Text('by ${_teamList[index].receiverfullName}'),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: ColorUtils.Yellow,
                    child: CustomButton(
                      onPress: () {},
                      buttonText: "Send Lunch",
                      buttonColor: ColorUtils.Yellow,
                      textColor: ColorUtils.Black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );

    // return const Placeholder();
  }
}
