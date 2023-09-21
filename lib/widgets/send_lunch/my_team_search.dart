import 'package:flutter/material.dart';
import 'package:hng_task3/widgets/custom_button.dart';

class MyTeamSearch extends StatefulWidget {
  const MyTeamSearch({super.key});

  @override
  State<MyTeamSearch> createState() => _MyTeamSearchState();
}

class _MyTeamSearchState extends State<MyTeamSearch> {
  List<UserData> MyTeamUsers = [
    UserData("Ike"),
    UserData("Jessy"),
    UserData("Theophilus"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: MyTeamUsers.map((item) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: item.icon),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Text(
                          "${item.secondaryName}",
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // CustomButton(onPress: () {})
            ],
          ),
        );
      }).toList(),
    );
  }
}

// Here is the class of the dummy data.
class UserData {
  String name;
  String? secondaryName;
  Image icon =
      const Image(image: AssetImage("assets/icons/man-avatar-icon.png"));

  UserData(this.name) {
    secondaryName = "by $name fast";
  }
}
