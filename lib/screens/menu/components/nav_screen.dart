import 'package:flutter/material.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/auth/auth_home.dart';
import 'package:hng_task3/screens/menu/components/current_screen.dart';
import 'package:hng_task3/screens/menu/configurations.dart';
import 'package:hng_task3/screens/menu/menu_screen.dart';
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
  DrawerItem item = DrawerItems.home;
  void selectedPage(DrawerItem selecteditem) {
    switch (selecteditem) {
      case DrawerItems.logout:
        Provider.of<AuthProvider>(context, listen: false).logout();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthHome(),
          ),
        );
        return;
      default:
        setState(() {
          item = selecteditem;

          Future.delayed(
            const Duration(milliseconds: 150),
            () {
              closeDrawer();
            },
          );
        });
    }
  }

  void openDrawer() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      Future.delayed(const Duration(milliseconds: 180), () {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            item: item,
            scaleFactor: scaleFactor,
            xOffset: xOffset,
            yOffset: yOffset,
          ),
        ],
      ),
    );
  }
}
