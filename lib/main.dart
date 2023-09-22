import 'package:flutter/material.dart';
import 'package:hng_task3/configs/theme.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/menu/components/nav_screen.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: theme,
        home: const NavScreen()
        //SplashScreen(),
      ),
    );
  }
}
