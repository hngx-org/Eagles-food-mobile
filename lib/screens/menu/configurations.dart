import 'package:flutter/material.dart';

class DrawerItem {
  final IconData icon;
  final String title;

  const DrawerItem({
    required this.icon,
    required this.title,
  });
}

class DrawerItems {
  static const home = DrawerItem(icon: Icons.home_filled, title: "Home");
  static const sendlunch = DrawerItem(title: 'Send Lunch', icon: Icons.send);
  static const withdrawlunch =
      DrawerItem(icon: Icons.receipt, title: "Withdraw Lunch");
  static const profile =
      DrawerItem(icon: Icons.person_outline, title: "Profile");

  static final List<DrawerItem> all = [
    home,
    sendlunch,
    withdrawlunch,
    profile,
  ];
}
