import 'package:flutter/material.dart';

class AvailableLunch extends StatefulWidget {
  const AvailableLunch({super.key});

  @override
  State<AvailableLunch> createState() => _AvailableLunchState();
}

class _AvailableLunchState extends State<AvailableLunch> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.24,
        width: MediaQuery.sizeOf(context).width * 0.95,
        child: Card(
          elevation: 5,
          shadowColor: const Color.fromRGBO(239, 206, 130, 1),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 120, 98, 1),
              Color.fromRGBO(43, 255, 178, 0.65),
              Color.fromRGBO(4, 118, 78, 1),
              Color.fromRGBO(3, 100, 66, 1)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ListTile(
                  title: Text(
                    'Available Lunches For Withdrawal',
                    style: TextStyle(fontSize: 24, fontStyle: FontStyle.normal),
                  ),
                  trailing: Wrap(
                    children: [Icon(Icons.info)],
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                //TODO DISPLAY THE NUMBER OF AVAILABLE LUNCHES
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.04,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: const Center(
                    child: Text(
                      '34',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.38,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(228, 178, 166, 1)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Withdraw Lunch',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.38,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(239, 206, 130, 1)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Send Lunch',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
