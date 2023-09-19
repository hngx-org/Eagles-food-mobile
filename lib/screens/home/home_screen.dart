import 'package:flutter/material.dart';
import 'package:hng_task3/screens/home/available_lunch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('Hello from Home Screen'),
            SizedBox(
              height:15 ,
            ),
            AvailableLunch(),
          ],
        ),
      ),
    );
  }
}
