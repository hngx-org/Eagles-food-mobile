import 'package:flutter/material.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:hng_task3/widgets/common/search_employee.dart';
import 'package:hng_task3/widgets/home/lunch_actions.dart';
import 'package:hng_task3/widgets/home/team.dart';
import 'package:hng_task3/widgets/lunch_history/lunch_history_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.openDrawer});
  final VoidCallback openDrawer;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> employees = [
    'Oben Ayuk Gilbert Abunaw',
    'Efosa Uyi-Idahor',
    'akamsr',
    'Godwin Adah',
    'Aaron Ogbemi',
  ];

  String selectedEmployee = '';
  FocusNode focusNode = FocusNode();

  bool isLoading = false;
  var user;

  List<dynamic> my_team = [];

 @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<TeamAndLunchProvider>(context, listen: false).getUsers();
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
    return Scaffold(
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
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: Image.asset('assets/icons/Frame 1.png'),
                onPressed: widget.openDrawer,
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: searchEmployeeBox(
                employees, (p0) => null, selectedEmployee, focusNode),
          ),
          const SizedBox(
            height: 18,
          ),
          const LunchActions(),
          const SizedBox(
            height: 32,
          ),
         TeamList(list: my_team),
          const SizedBox(
            height: 25,
          ),
          const LunchHistoryWidget(
            limit: true,
          )
        ],
      ),
    ));
  }
}
