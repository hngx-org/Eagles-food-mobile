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
  late TabController _Controller = TabController(length: 2, vsync: this);

  @override
  void initState() {
    _Controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
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
          Expanded(
            child: TabBarView(
              controller: _Controller,
              children: const <Widget>[
                MyTeamSearch(),
                EveryoneSearch(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
