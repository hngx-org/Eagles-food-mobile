import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/menu/components/nav_screen.dart';
import 'package:hng_task3/widgets/custom_button.dart';

class WithdrawSuccessScreen extends StatelessWidget {
  const WithdrawSuccessScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Image.asset('assets/images/withdraw-success.png', height: 340,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28,),
                child: Text(
                  'Your Free Lunch has been Withdrawn',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Congratulations, you have withdrawn "numOfFreeLunch" Free Lunches. Click continue to proceed',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: CustomButton(onPress: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NavScreen()), (route)=>false);
                  }, buttonText: "Continue", buttonColor: ColorUtils.Green, textColor: ColorUtils.White, isUppercase: true),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
