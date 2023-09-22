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
      // This approach allows the app bar to remain floating and adds a padding
      // to the return button. Avoid editing Except a change in design occurs.
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.only(right: 80, left: 20),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                icon: Image.asset("assets/icons/icon-back.png"),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavScreen()));
                },
              ),
              // child: Image(
              //   image: AssetImage("assets/icons/icon-back.png"),
              //   color: null,
              // ),
            ),
          ),
        ),
      ),

      // TODO Test if there is a better way of handling the UI without the
      // singlechildscrollview.

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: NavigationScreenWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
