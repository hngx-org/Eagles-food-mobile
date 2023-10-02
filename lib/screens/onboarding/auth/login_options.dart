import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/onboarding/auth/login.dart';
class LoginOptions extends StatefulWidget {
  const LoginOptions({super.key});

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                }, buttonText: "Login With Email", buttonColor: ColorUtils.Green, textColor: ColorUtils.White, icon: "assets/icons/icon-email.png", iconHeight: 30, iconWidth: 30, padding: const EdgeInsets.symmetric(vertical: 20),),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomButton(onPress: (){}, buttonText: "Login With Google", isOutlined: true, outlineColor: ColorUtils.LightGrey, textColor: ColorUtils.Black, icon: "assets/icons/icon-google.png", iconHeight: 30, iconWidth: 30, padding: const EdgeInsets.symmetric(vertical: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
