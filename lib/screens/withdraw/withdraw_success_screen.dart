import 'package:flutter/material.dart';
import 'package:hng_task3/widgets/withdraw/withdraw_image.dart';

class WithdrawSuccessScreen extends StatelessWidget {
  const WithdrawSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw Success Screen'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('Hello from Withdraw screen'),
            WithdrawImage(),
          ],
        ),
      ),
    );
  }
}
