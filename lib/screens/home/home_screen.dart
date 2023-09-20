import 'package:flutter/material.dart';
import 'package:hng_task3/widgets/home/team.dart';

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
        // body: SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //     child: Column(
        //       children: [
        //         Row(
        //           children: [
        //             const Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text('Good Morning'),
        //                 Text('Williams'),
        //               ],
        //             ),
        //             const Spacer(),
        //             IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         Container(
        //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //           decoration: BoxDecoration(
        //             border: Border.all(color: Colors.grey),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: const Row(
        //             children: [
        //               Icon(Icons.search),
        //               SizedBox(width: 10),
        //               Expanded(
        //                 child: TextField(
        //                   decoration: InputDecoration(
        //                     hintText: 'Search for employee',
        //                     border: InputBorder.none,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         const LunchActions(),
        //         const SizedBox(
        //           height: 40,
        //         ),
        //         const Team(),
        //       ],
        //     ),
        //   ),
        // )
        body: const TeamList());
  }
}
