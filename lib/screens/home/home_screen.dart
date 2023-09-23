import 'package:flutter/material.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
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
    'John Doe',
    'Jane Smith',
    'Mark Johnson',
    'Emily Davis',
  ];

  String selectedEmployee = '';
  FocusNode focusNode = FocusNode();

  bool isLoading = false;
  var user;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

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
                            style: Theme.of(context).textTheme.bodyLarge
                            //?.copyWith(fontWeight: FontWeight.w700),
                            ),
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
          const SizedBox(
            height: 30,
          ),
          searchEmployeeBox(employees, (p0) => null, selectedEmployee, focusNode),
          const SizedBox(
            height: 18,
          ),
          const LunchActions(),
          const SizedBox(
            height: 32,
          ),
          const TeamList(),
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
