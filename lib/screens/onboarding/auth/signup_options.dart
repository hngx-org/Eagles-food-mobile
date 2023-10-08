import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/onboarding/auth/organization_signup.dart';
import 'package:hng_task3/screens/onboarding/auth/signup.dart';


class SignUpOption extends StatelessWidget {
  const SignUpOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Image.asset("assets/icons/icon-back.png", height: 50, width: 50, fit: BoxFit.contain,),
        ),
      ),
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
                child: Text("Join the Free Lunch Club",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorUtils.Grey
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomButton(onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
                }, buttonText: "Create a user account", buttonColor: ColorUtils.Green, textColor: ColorUtils.White, isUppercase: true),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomButton(onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrganisationSignUp()));
                }, buttonText: "Create an organization account", buttonColor: ColorUtils.Green, textColor: ColorUtils.White, isUppercase: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}