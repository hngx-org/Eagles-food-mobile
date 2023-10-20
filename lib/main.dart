import 'package:flutter/material.dart';
import 'package:hng_task3/configs/lightTheme.dart';
import 'package:hng_task3/configs/darkTheme.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/InvitesProvider.dart';
import 'package:hng_task3/providers/OrganizationProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/screens/onboarding/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TeamAndLunchProvider>(
            create: (_) => TeamAndLunchProvider()),
        ChangeNotifierProvider<InvitesProvider>(
            create: (_) => InvitesProvider()),
        ChangeNotifierProvider<OrganizationProvider>(
            create: (_) => OrganizationProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<OrganizationProvider>(
            create: (_) => OrganizationProvider()),
      ],
      child: MaterialApp(
        // theme: ThemeData.light(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
