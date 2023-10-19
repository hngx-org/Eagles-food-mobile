import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/home/menu/menu_screen.dart';
import 'package:hng_task3/screens/onboarding/auth/auth_home.dart';
import 'package:hng_task3/utils/dialogs.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  String item = "home";
  var _currentIndex = 0;

  void selectedPage(String selecteditem) {
    switch (selecteditem) {
      case "logout":
        Dialogs.logoutDialog(context: context);
        // Provider.of<AuthProvider>(context, listen: false).logout();
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const AuthHome(),
        //   ), (route) => false
        // );
        return;
      default:
        setState(() {
          item = selecteditem;
          _currentIndex = getSelectedIndex(selecteditem);
          Future.delayed(
            const Duration(milliseconds: 150),
                () {
              closeDrawer();
            },
          );
        });
    }
  }

  int getSelectedIndex(String selectedItem) {
    switch (selectedItem) {
      case "home":
        return 0;
      case "sendlunch":
        return 1;
      case "withdrawlunch":
        return 2;
      case "profile":
        return 3;
      case "invitepage":
        return 4;
      case "manageinvites":
        return 5;
      case "userjoinrequest":
        return 8;
      default:
        return 0;
    }
  }


  void openDrawer() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          xOffset = 230;
          yOffset = 200;
          scaleFactor = 0.7;
          isDrawerOpen = true;
        });
      });
    } else {
      setState(() {
        xOffset = 250;
        yOffset = 200;
        scaleFactor = 0.7;
        isDrawerOpen = true;
      });
    }
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  User? user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    // print(user?.isAdmin);
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          MenuScreen(
            closeDrawer: closeDrawer,
            selectedItem: item,
            selectPage: selectedPage,
          ),
          CurrentScreen(
            closeDrawer: closeDrawer,
            openDrawer: openDrawer,
            isDrawerOpen: isDrawerOpen,
            item: _currentIndex,
            scaleFactor: scaleFactor,
            xOffset: xOffset,
            yOffset: yOffset,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Theme.of(context).backgroundColor,
        notchMargin: 8,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20)
            ),
            boxShadow: [
              BoxShadow(
                color: ColorUtils.Grey.withOpacity(0.1),
                offset: const Offset(0, -1),
                blurRadius: 1,
              ),
            ],
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.home,
                        color: _currentIndex == 0 ? ColorUtils.Green : ColorUtils.Grey,
                        size: 22,
                      ),
                      if(_currentIndex == 0) Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("Home",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: ColorUtils.Green,
                          ),
                        ),
                      )
                    ],
                  )
              ),

              user?.isAdmin != "True" ? MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 6;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.group,
                        color: _currentIndex == 6 ? ColorUtils.Green : ColorUtils.Grey,
                        size: 22,
                      ),

                      if(_currentIndex == 6) Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("Organizations",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: ColorUtils.Green,
                          ),
                        ),
                      )
                    ],
                  )
              ) : MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 8;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.group,
                        color: _currentIndex == 8 ? ColorUtils.Green : ColorUtils.Grey,
                        size: 22,
                      ),

                      if(_currentIndex == 8) Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("Join Requests",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: ColorUtils.Green,
                          ),
                        ),
                      )
                    ],
                  )
              ) ,

              MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 7;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.bar_chart,
                        color: _currentIndex == 7 ? ColorUtils.Green : ColorUtils.Grey,
                        size: 22,
                      ),
                      if(_currentIndex == 7) Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("Leaderboard",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: ColorUtils.Green,
                          ),
                        ),
                      )
                    ],
                  )
              ),

              user?.isAdmin != "True" ? MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 4;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.insert_invitation,
                        color: _currentIndex == 4 ? ColorUtils.Green : ColorUtils.Grey,
                        size: 22,
                      ),

                      if(_currentIndex == 4) Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("Invites",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: ColorUtils.Green,
                          ),
                        ),
                      )
                    ],
                  )
              ) :
              MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 5;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.manage_accounts,
                        color: _currentIndex == 5 ? ColorUtils.Green : ColorUtils.Grey,
                        size: 22,
                      ),

                      if(_currentIndex == 5) Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("Send Invites",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: ColorUtils.Green,
                          ),
                        ),
                      )
                    ],
                  )
              ),

              MaterialButton(
                  minWidth: 40,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle_outlined,
                        color: _currentIndex == 3 ? ColorUtils.Green : ColorUtils.Grey,
                        size: 22,
                      ),

                      if(_currentIndex == 3) Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text("Profile",
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: ColorUtils.Green,
                          ),
                        ),
                      )
                    ],
                  )
              ),

            ],
          ),
        ),
      ),

    );
  }
}
