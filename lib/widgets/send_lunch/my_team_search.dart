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
    return Placeholder();
    // return Padding(
    //   padding: EdgeInsets.all(30),
    //   child: ListView.builder(
    //     itemCount: MyTeamUsers.length,
    //     itemBuilder: (context, index) {
    //       UserData user = MyTeamUsers[index];
    //       return Row(
    //         children: [user.icon],
    //       );
    //     },
    //   ),
    // );
  }
}

class UserData {
  String name;
  String? secondaryName;
  Image icon =
      const Image(image: AssetImage("assets/icons/man-avatar-icon.png"));

  UserData(this.name) {
    secondaryName = "by $name fast";
  }
}
