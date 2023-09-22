import 'package:flutter/material.dart';
import 'package:hng_task3/widgets/home/lunch_actions.dart';
import 'package:hng_task3/widgets/home/team.dart';
import 'package:hng_task3/widgets/lunch_history/lunch_history_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.openDrawer});
  final VoidCallback openDrawer;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              //vertical: 10,
              horizontal: 20),
          child: SingleChildScrollView(
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
                                text: 'Morning',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontWeight: FontWeight
                                            .w700), // Apply the style only to 'Morning'
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Williams',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 24),
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
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.grey.shade200,
                    //borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.grey,
                            hintText: 'Search for employee',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w100),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 35,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
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
                 const LunchHistoryWidget(limit: true,)
              ],
            ),
          ),
        ));
  }
}
