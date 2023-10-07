import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

import '../../../models/user.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen(
      {super.key,
      required this.closeDrawer,
      required this.selectedItem,
      required this.selectPage
      });

  final String selectedItem;
  final VoidCallback closeDrawer;
  final Function(String item) selectPage;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    SessionManager().getUser().then((userJson) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          user = User.fromJson(userJson);
        });
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    user ??= Provider.of<AuthProvider>(context).user;
    return Scaffold(
      backgroundColor:  Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/logo/logo_green.png",),
                      ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Free lunch',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Main menu",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                      // const Spacer(),

                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: IconButton(
                            onPressed: widget.closeDrawer,
                            icon: const Icon(Icons.close)),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        onTap: () => widget.selectPage("home"),
                        leading: Icon(
                            Icons.home_filled,
                          color: widget.selectedItem == "home"
                              ? ColorUtils.Green
                              : ColorUtils.Black.withOpacity(0.5),
                        ),
                        title: Text(
                          "home",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color: widget.selectedItem == "home"
                                ? ColorUtils.Green
                                : ColorUtils.Black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        onTap: () => widget.selectPage("sendlunch"),
                        leading: Icon(
                          Icons.send,
                          color: widget.selectedItem == "sendlunch"
                              ? ColorUtils.Green
                              : ColorUtils.Black.withOpacity(0.5),
                        ),
                        title: Text(
                          "Send Lunch",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color: widget.selectedItem == "sendlunch"
                                ? ColorUtils.Green
                                : ColorUtils.Black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        onTap: () => widget.selectPage("withdrawlunch"),
                        leading: Icon(
                          Icons.receipt,
                          color: widget.selectedItem == "withdrawlunch"
                              ? ColorUtils.Green
                              : ColorUtils.Black.withOpacity(0.5),
                        ),
                        title: Text(
                          "Withdraw Lunch",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color: widget.selectedItem == "withdrawlunch"
                                ? ColorUtils.Green
                                : ColorUtils.Black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        onTap: () => widget.selectPage("profile"),
                        leading: Icon(
                          Icons.person_outline,
                          color: widget.selectedItem == "profile"
                              ? ColorUtils.Green
                              : ColorUtils.Black.withOpacity(0.5),
                        ),
                        title: Text(
                          "Profile",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color: widget.selectedItem == "profile"
                                ? ColorUtils.Green
                                : ColorUtils.Black,
                          ),
                        ),
                      ),
                    ),
                    if(user?.isAdmin != true ) SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        onTap: () => widget.selectPage("invitepage"),
                        leading: Icon(
                          Icons.insert_invitation,
                          color: widget.selectedItem == "invitepage"
                              ? ColorUtils.Green
                              : ColorUtils.Black.withOpacity(0.5),
                        ),
                        title: Text(
                          "Invites",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color: widget.selectedItem == "invitepage"
                                ? ColorUtils.Green
                                : ColorUtils.Black,
                          ),
                        ),
                      ),
                    ),
                    if(user?.isAdmin == true )SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        onTap: () => widget.selectPage("manageinvites"),
                        leading: Icon(
                          Icons.manage_accounts_outlined,
                          color: widget.selectedItem == "manageinvites"
                              ? ColorUtils.Green
                              : ColorUtils.Black.withOpacity(0.5),
                        ),
                        title: Text(
                          "Manage Invites",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color: widget.selectedItem == "manageinvites"
                                ? ColorUtils.Green
                                : ColorUtils.Black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        onTap: () => widget.selectPage("logout"),
                        leading: Icon(
                          Icons.manage_accounts_outlined,
                          color: widget.selectedItem == "logout"
                              ? ColorUtils.Green
                              : ColorUtils.Black.withOpacity(0.5),
                        ),
                        title: Text(
                          "Logout",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                            color: widget.selectedItem == "logout"
                                ? ColorUtils.Green
                                : ColorUtils.Black,
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
                const Spacer(),
                const Column(
                  children: [
                    Text(
                      "Free Lunch App",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: "Poppins",
                        color: Color(0xFF868686),
                      ),
                    ),
                    Text(
                      "App version 1.0.0",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: "Poppins",
                        color: Color(0xB2B1B1C3),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
