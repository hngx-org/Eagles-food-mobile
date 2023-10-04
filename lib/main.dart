import 'package:flutter/material.dart';
import 'package:hng_task3/configs/lightTheme.dart';
import 'package:hng_task3/configs/darkTheme.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/InvitesProvider.dart';
import 'package:hng_task3/providers/InvitesProvider.dart';
import 'package:hng_task3/providers/ProfileProvider.dart';
import 'package:hng_task3/providers/ProfileProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/screens/invites/invites.dart';
import 'package:hng_task3/screens/invites/invites_history.dart';
import 'package:hng_task3/screens/invites/invites_reply_success.dart';

import 'package:hng_task3/screens/onboarding/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<TeamAndLunchProvider>(create: (_) => TeamAndLunchProvider()),
        ChangeNotifierProvider<InvitesProvider>(create: (_) => InvitesProvider()),
        ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const SplashScreen(),
         ),
    );
  }
}
