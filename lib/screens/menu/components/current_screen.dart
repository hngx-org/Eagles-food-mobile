import 'package:flutter/material.dart';
import 'package:hng_task3/providers/num_of_free_lunch_provider.dart';
import 'package:hng_task3/screens/home/home_screen.dart';
import 'package:hng_task3/screens/menu/configurations.dart';
// import 'package:hng_task3/screens/send_lunch/send_lunch_screen.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_search.dart';
import 'package:hng_task3/screens/withdraw/withdraw_lunch.dart';
import 'package:provider/provider.dart';

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
  final DrawerItem item;

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
              child: getDrawerPage(openDrawer, item,context),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage(VoidCallback openDrawer, DrawerItem item,BuildContext context) {
    final numOfFreeLunchProvider = Provider.of<NumOfFreeLunchProvider>(context);
    switch (item) {
      case DrawerItems.home:
        return HomeScreen(
          openDrawer: openDrawer,
        );
      case DrawerItems.sendlunch:
        return const SendLunchSearch();
      case DrawerItems.withdrawlunch:
        return  WithdrawLunch(numOfFreeLunchProvider: numOfFreeLunchProvider ,);

      default:
        return HomeScreen(
          openDrawer: openDrawer,
        );
    }
  }
}
