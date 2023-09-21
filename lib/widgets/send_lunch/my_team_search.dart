import 'package:flutter/material.dart';

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
    // TODO Fix the space between the navbar and dummy data

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: MyTeamUsers.length,
      itemBuilder: (context, index) {
        UserData user = MyTeamUsers[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50), child: user.icon),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text(
                      user.name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      "${user.secondaryName}",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
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
