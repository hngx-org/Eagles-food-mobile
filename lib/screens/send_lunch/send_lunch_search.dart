import 'package:flutter/material.dart';
import 'package:hng_task3/widgets/send_lunch/send_lunch_searchbar.dart';
import 'package:hng_task3/widgets/send_lunch/navigationwidget.dart';
import 'package:hng_task3/screens/menu/components/nav_screen.dart';

class SendLunchSearch extends StatefulWidget {
  const SendLunchSearch({super.key});

  @override
  State<SendLunchSearch> createState() => _SendLunchSearchState();
}

class _SendLunchSearchState extends State<SendLunchSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset("assets/icons/icon-back.png"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: Column(
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
          const Expanded(
            child: NavigationScreenWidget(),
          ),
        ],
      ),
    );
  }
}
