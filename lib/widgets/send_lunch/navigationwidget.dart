import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/send_lunch/my_team_search.dart';
import 'package:hng_task3/widgets/send_lunch/everyone_search.dart';

class NavigationScreenWidget extends StatefulWidget {
  const NavigationScreenWidget({super.key});

  @override
  State<NavigationScreenWidget> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreenWidget>
    with TickerProviderStateMixin {
  late TabController _Controller = new TabController(length: 2, vsync: this);

  @override
  void initState() {
    _Controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4,
          indicatorColor: ColorUtils.Green,
          labelColor: ColorUtils.Green,
          unselectedLabelColor: ColorUtils.LightGrey,
          controller: _Controller,
          tabs: const [
            Tab(
              icon: Text(""),
              text: 'My Team',
            ),
            Tab(
              icon: Text(""),
              text: 'Everyone',
            ),
          ],
        ),

        // TODO Attempt to remove the mediaquery.
        Container(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            controller: _Controller,
            children: const <Widget>[
              MyTeamSearch(),
              EveryoneSearch(),
            ],
          ),
        ),
      ],
    );
  }
}
