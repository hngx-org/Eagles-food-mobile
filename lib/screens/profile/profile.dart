import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/home/menu/components/nav_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NavScreen()),
                    (route) => false);
              },
              child: Image.asset(
                "assets/icons/icon-back.png",
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Profile",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NavScreen()),
                    (route) => false);
              },
              child: Image.asset(
                "assets/icons/icon-edit.png",
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            SizedBox(
              width: 104,
              height: 104,
              child: CircleAvatar(
                  // backgroundImage:
                  ),
            ),

            // Name
            Text(
              'Test',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            // Location
            Text(
              'Test',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            // Email address
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage("assets/icons/icon-email-green.png"),
              ),
              title: Column(children: [
                Text(
                  "holder",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Holder",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
