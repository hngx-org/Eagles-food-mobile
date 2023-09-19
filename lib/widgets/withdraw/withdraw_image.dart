import 'package:flutter/material.dart';

class WithdrawImage extends StatelessWidget {
  const WithdrawImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const Text('Withdraw Image'),
        Container(
          margin: const EdgeInsets.only(
            top: 30,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          width: 200,
          child: Image.asset('assets/images/withdraw-success.png'),
        ),
      ]),
    );
  }
}
