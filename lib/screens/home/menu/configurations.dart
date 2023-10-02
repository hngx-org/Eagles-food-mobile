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
  static const profilePage =
  DrawerItem(icon: Icons.person_outline, title: "Profile");
  static const invitesPage =
  DrawerItem(icon: Icons.insert_invitation, title: "Invites");
  static const logout =
      DrawerItem(icon: Icons.power_settings_new_sharp, title: "Logout");

  static final List<DrawerItem> all = [
    home,
    sendlunch,
    withdrawlunch,
    profilePage,
    invitesPage,
    logout,
  ];
}
