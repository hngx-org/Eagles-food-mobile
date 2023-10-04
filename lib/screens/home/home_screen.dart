import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/components/widgets/common/search_employee.dart';
import 'package:hng_task3/components/widgets/home/team.dart';
import 'package:hng_task3/components/widgets/lunch_history/lunch_history_widget.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/models/team.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_search.dart';
import 'package:hng_task3/screens/withdraw_lunch/withdraw_lunch.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.openDrawer});

  final VoidCallback openDrawer;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedEmployee = '';
  FocusNode focusNode = FocusNode();

  bool isLoading = false;
  var user;

  List<Team> my_team = [];
  List<Lunch> lunch_history = [];

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<TeamAndLunchProvider>(context, listen: false).getUsers();
    my_team.isEmpty ? Provider.of<TeamAndLunchProvider>(context, listen: false).getLunchHistory() : null;
    SessionManager().getUser().then((userJson) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          user = User.fromJson(userJson);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    my_team = Provider.of<TeamAndLunchProvider>(context).my_team;
    lunch_history = Provider.of<TeamAndLunchProvider>(context).lunchHistory;
    return Scaffold(
        backgroundColor:  Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 50,
        right: 20,
        left: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Good ',
                            style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(
                          text: Utils.getTimeOfDay(),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight
                                  .w700), // Apply the style only to 'Morning'
                        ),
                      ],
                    ),
                  ),
                  Text(
                    user?.firstName ?? '',
                    style:
                        Theme.of(context).textTheme.displayMedium?.copyWith(),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: Image.asset('assets/icons/Frame 1.png', ),
                onPressed: widget.openDrawer,
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: searchEmployeeBox(
              my_team,
              (p0) => null,
              selectedEmployee,
              focusNode,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: ColorUtils.Green,
              image: const DecorationImage(
                image: AssetImage("assets/images/withdrawal-bg.png"),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorUtils.Yellow,
                  spreadRadius: 1.0,
                  offset: const Offset(7, 7.0),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomButton(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WithdrawLunch(
                                user: user
                              )));
                    },
                    buttonText: "Withdraw Lunch",
                    buttonColor: ColorUtils.DeepPink,
                    fontSize: 13,
                    textColor: ColorUtils.Black,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: CustomButton(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SendLunchSearch()));
                    },
                    buttonText: "Send Lunch",
                    buttonColor: ColorUtils.Yellow,
                    fontSize: 13,
                    textColor: ColorUtils.Black,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TeamList(list: my_team),
          ),

          if (lunch_history.length > 0)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: LunchHistoryWidget(
                limit: true,
                history: lunch_history,
              ),
            )
        ],
      ),
    ));
  }
}
