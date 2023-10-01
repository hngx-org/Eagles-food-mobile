import 'package:flutter/material.dart';

class WithdrawImage extends StatelessWidget {
  const WithdrawImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(
            top: 30,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          width: 293,
          height: 284,
          child: Stack(children: [
            Image.asset('assets/images/withdraw-success.png'),
            Positioned(
              top: 20,
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: Image.asset('assets/images/plus_green.png'),
            )),
            Positioned(
              right: 50,
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: Image.asset('assets/images/plus_green.png'),
            )),
            Positioned(
              bottom: 50,
                right: 10,
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: Image.asset('assets/images/plus_green.png'),
            )),
            Positioned(
              bottom: 60,
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: Image.asset('assets/images/circle_green.png'),
            )),
            Positioned(
              left: 50,
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: Image.asset('assets/images/minus_green.png'),
            )) ,
            Positioned(
              right: 20,
                top: 50,
                child: SizedBox(
                  height: 9,
                  width: 9,
                  child: Image.asset('assets/images/minus_green.png'),
            )),
          ]),
        ),
      ]),
    );
  }
}
