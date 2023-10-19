import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/home/home_screen.dart';
import 'package:hng_task3/screens/invites/invites.dart';
import 'package:hng_task3/screens/invites/org_join_request.dart';
import 'package:hng_task3/screens/invites/organizations.dart';
import 'package:hng_task3/screens/invites/send_invites.dart';
import 'package:hng_task3/screens/leaderboard/leaderboard.dart';
import 'package:hng_task3/screens/profile/profile.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_search.dart';
import 'package:hng_task3/screens/withdraw_lunch/withdraw_lunch.dart';
import 'package:provider/provider.dart';

import '../../../models/user.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen(
      {super.key,
      required this.closeDrawer,
      required this.selectedItem,
      required this.selectPage});

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
    // SessionManager().getUser().then((userJson) {
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     setState(() {
    //       user = User.fromJson(userJson);
    //     });
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user ??= Provider.of<AuthProvider>(context).user;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          // ignore: deprecated_member_use
          color: Theme.of(context).backgroundColor,
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
                          child: Image.asset(
                            "assets/logo/logo_green.png",
                          ),
                        ),
                      ),
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
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: IconButton(
                            onPressed: widget.closeDrawer,
                            icon: const Icon(Icons.close)),
                      ),
                    ],
                  ),
                ),
                Column(children: [
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
                            : ColorUtils.Grey,
                      ),
                      title: Text("Home",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium! /* .copyWith(
                              color: widget.selectedItem == "home"
                                  ? ColorUtils.Green
                                  : ColorUtils.Black,
                            ), */
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
                            : ColorUtils.Grey,
                      ),
                      title: Text("Send Lunch",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium! /* .copyWith(
                              color: widget.selectedItem == "sendlunch"
                                  ? ColorUtils.Green
                                  : ColorUtils.Black,
                            ), */
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
                            : ColorUtils.Grey,
                      ),
                      title: Text("Withdraw Lunch",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium! /* .copyWith(
                              color: widget.selectedItem == "withdrawlunch"
                                  ? ColorUtils.Green
                                  : ColorUtils.Black,
                            ), */
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
                            : ColorUtils.Grey,
                      ),
                      title: Text("Profile",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium! /* .copyWith(
                              color: widget.selectedItem == "profile"
                                  ? ColorUtils.Green
                                  : ColorUtils.Black,
                            ), */
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
                      onTap: () => widget.selectPage("invitepage"),
                      leading: Icon(
                        Icons.insert_invitation,
                        color: widget.selectedItem == "invitepage"
                            ? ColorUtils.Green
                            : ColorUtils.Grey,
                      ),
                      title: Text("Invites",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium! /* .copyWith(
                              color: widget.selectedItem == "invitepage"
                                  ? ColorUtils.Green
                                  : ColorUtils.Black,
                            ), */
                          ),
                    ),
                  ),
                  if (user?.isAdmin == "True")
                    SizedBox(
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
                              : ColorUtils.Grey,
                        ),
                        title: Text("Manage Invites",
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyMedium!
                            /* .copyWith(
                                color: widget.selectedItem == "manageinvites"
                                    ? ColorUtils.Green
                                    : ColorUtils.Black,
                              ), */
                            ),
                      ),
                    ),
                  if (user?.isAdmin == "True")
                    SizedBox(
                      width: 150,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 3,
                        ),
                        onTap: () => widget.selectPage("userjoinrequest"),
                        leading: Icon(
                          Icons.send,
                          color: widget.selectedItem == "userjoinrequest"
                              ? ColorUtils.Green
                              : ColorUtils.Grey,
                        ),
                        title: Text("User Join Request",
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyMedium!
                            /*  .copyWith(
                                color: widget.selectedItem == "userjoinrequest"
                                    ? ColorUtils.Green
                                    : ColorUtils.Black,
                              ), */
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
                      leading:
                          Icon(Icons.power_settings_new, color: ColorUtils.Red),
                      title: Text("Logout",
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium! /* .copyWith(
                              color: widget.selectedItem == "logout"
                                  ? ColorUtils.Green
                                  : ColorUtils.Black,
                            ), */
                          ),
                    ),
                  ),
                ]),
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

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({
    required this.isDrawerOpen,
    required this.xOffset,
    required this.yOffset,
    required this.scaleFactor,
    super.key,
    required this.closeDrawer,
    required this.openDrawer,
    required this.item,
  });

  final bool isDrawerOpen;
  final VoidCallback openDrawer;
  final VoidCallback closeDrawer;
  final double xOffset;
  final double yOffset;
  final double scaleFactor;
  final int item;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        child: AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor)
            ..rotateZ(isDrawerOpen ? 24.999 : 0),
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(239, 233, 232, 232),
                blurRadius: 5,
                offset: Offset(-30, 10), // Shadow position
              ),
            ],
            borderRadius: BorderRadius.circular(25),
          ),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 25 : 0),
              child: getDrawerPage(openDrawer, item, context),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage(
      VoidCallback openDrawer, int item, BuildContext context) {
    switch (item) {
      case 0:
        return HomeScreen(
          openDrawer: openDrawer,
        );
      case 1:
        return const SendLunchSearch();
      case 2:
        return const WithdrawLunch();
      case 3:
        return const Profile();
      case 4:
        return const Invites();
      case 5:
        return const SendInvites();
      case 6:
        return const Organizations();
      case 7:
        return const LeaderBoardScreen();
      case 8:
        return const OrgJoinRequest();

      default:
        return HomeScreen(
          openDrawer: openDrawer,
        );
    }
  }
}
