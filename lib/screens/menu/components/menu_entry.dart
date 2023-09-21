import 'package:flutter/material.dart';
import 'package:hng_task3/screens/menu/menu_screen.dart';

import 'menu_home.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          MenuScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
