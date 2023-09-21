import 'package:flutter/material.dart';
import 'package:hng_task3/widgets/withdraw/withdraw_image.dart';
import 'package:hng_task3/screens/withdraw/withdraw_lunch.dart';

class WithdrawSuccessScreen extends StatelessWidget {
  const WithdrawSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Withdraw Success Screen'),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const WithdrawImage(),
              const SizedBox(height: 30),
              //Text('Hello from Withdraw screen'),
              const Text('Your Free Lunch has been Withdrawn',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,),
              const SizedBox(height: 50),

              const Text(
                'Congratulations, you have withdrawn 50 Free Lunches. Click continue to proceed',
                textAlign: TextAlign.center,),
              const SizedBox(height: 50),
              SizedBox(
                width: 320,
                height: 50,
                child: ElevatedButton(
                  child: const Text('CONTINUE'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 19, 107, 22),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero))
                  ),
                  onPressed: () {
                    Navigator.pop(
                        context,
                        //Route to homescreen
                        MaterialPageRoute(builder: (context) => const WithdrawLunch()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
