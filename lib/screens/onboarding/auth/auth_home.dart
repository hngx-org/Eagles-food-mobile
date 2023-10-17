import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/onboarding/auth/login.dart';
import 'package:hng_task3/screens/onboarding/auth/signup.dart';
import 'package:hng_task3/screens/onboarding/auth/signup_options.dart';
class AuthHome extends StatefulWidget {
  const AuthHome({super.key});

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset("assets/logo/logo_green.png", height: 140, width: 140, fit: BoxFit.contain,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:10.0),
                  child: Text("Free Launch",
                  style: Theme.of(context).textTheme.displayLarge,),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("Reward Employees with Lunch",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorUtils.Grey
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50, bottom: 30),
                child: Text("Elevate your afternoons with a touch of flavor.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                ),),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomButton(onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                }, buttonText: "Login", buttonColor: ColorUtils.Green, textColor: ColorUtils.White, isUppercase: true),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomButton(onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpOption()));
                }, buttonText: "Create an account", buttonColor: ColorUtils.Pink, textColor: ColorUtils.Grey, isUppercase: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
