import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/profile/change_password.dart';
import 'package:hng_task3/screens/profile/edit_profile.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  User? user;
  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorUtils.Green,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/icons/icon-back.png",
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Settings",
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontWeight: FontWeight.w900, color: ColorUtils.White),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "Personalise your account settings",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                )),
            TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(
                        user: user,
                      ),
                    ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).disabledColor,
                ),
                child: Row(children: [
                  Icon(Icons.edit, size: 20, color: ColorUtils.Green),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Edit Profile",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 18),
                      ))
                ]),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePassword(user: user),
                    ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).disabledColor,
                ),
                child: Row(children: [
                  Icon(Icons.password, size: 20, color: ColorUtils.Green),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Change Password",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
