import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/components/widgets/send_lunch/everyone_search.dart';
import 'package:hng_task3/components/widgets/send_lunch/my_team_search.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/team.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:provider/provider.dart';

class NavigationScreenWidget extends StatefulWidget {
  const NavigationScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationScreenWidget> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreenWidget>
    with TickerProviderStateMixin {
  late TabController _controller = TabController(length: 2, vsync: this);

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myTeam = Provider.of<TeamAndLunchProvider>(context).my_team;
    var everyone = Provider.of<TeamAndLunchProvider>(context).everyone;


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
            controller: _controller,
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
              controller: _controller,
              children: <Widget>[
                MyTeamSearch(list: myTeam),
                EveryoneSearch(list: everyone),
              ],
            ),
          ),



        ],
      ),
    );
  }
}
