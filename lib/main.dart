import 'package:flutter/material.dart';
import 'package:hng_task3/configs/lightTheme.dart';
import 'package:hng_task3/configs/darkTheme.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/InvitesProvider.dart';
import 'package:hng_task3/providers/ProfileProvider.dart';
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
        ChangeNotifierProvider(create: (_) => TeamAndLunchProvider()),
        ChangeNotifierProvider(create: (_) => InvitesProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
