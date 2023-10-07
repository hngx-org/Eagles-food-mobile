import 'package:flutter/material.dart';
import 'package:hng_task3/screens/home/home_screen.dart';
import 'package:hng_task3/screens/invites/invites.dart';
import 'package:hng_task3/screens/invites/send_invites.dart';
import 'package:hng_task3/screens/profile/profile.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_search.dart';
import 'package:hng_task3/screens/withdraw_lunch/withdraw_lunch.dart';

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
        return WithdrawLunch();
      case 3:
        return const Profile();
      case 4:
        return const Invites();
      case 5:
        return const SendInvites();

      default:
        return HomeScreen(
          openDrawer: openDrawer,
        );
    }
  }
}
