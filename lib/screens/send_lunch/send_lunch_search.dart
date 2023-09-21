import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/send_lunch/send_lunch_searchbar.dart';
import 'package:hng_task3/widgets/send_lunch/my_team_search.dart';
import 'package:hng_task3/widgets/send_lunch/everyone_search.dart';

class SendLunchSearch extends StatefulWidget {
  const SendLunchSearch({super.key});

  @override
  State<SendLunchSearch> createState() => _SendLunchSearchState();
}

class _SendLunchSearchState extends State<SendLunchSearch> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MyTeamSearch(),
    EveryoneSearch(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // This approach allows the app bar to remain floating and adds a padding
      // to the return button. Avoid editing Except a change in design occurs.
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.only(right: 80, left: 20),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: const SizedBox(
              width: 50,
              height: 50,
              child: Image(
                image: AssetImage("assets/icons/icon-back.png"),
                color: null,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                "Send Lunch",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 29, vertical: 13),
                child: SendLunchSearchBar(),
              ),
            ),

            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            )

            // Navigation
            // BottomNavigationBar(
            //   elevation: 0,
            //   currentIndex: _currentIndex,
            //   onTap: (int index) {
            //     setState(() {
            //       _currentIndex = index;
            //     });
            //   },
            //   selectedItemColor: ColorUtils.Green,
            //   unselectedItemColor: ColorUtils.Grey.withOpacity(0.5),
            //   selectedLabelStyle: Theme.of(context).textTheme.displaySmall,
            //   unselectedLabelStyle: Theme.of(context).textTheme.displaySmall,
            //   items: [
            //     BottomNavigationBarItem(
            //       label: "My Team",
            //       icon: Text("", style: Theme.of(context).textTheme.titleLarge),
            //     ),
            //     BottomNavigationBarItem(
            //       label: "Everyone",
            //       icon: Text("", style: Theme.of(context).textTheme.titleLarge),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
