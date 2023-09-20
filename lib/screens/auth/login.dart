import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/auth/signup.dart';
import 'package:hng_task3/widgets/custom_button.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/icons/icon-back.png", height: 50, width: 50, fit: BoxFit.contain,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/logo/logo_green.png", height: 50, width: 50, fit: BoxFit.contain,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text("Free Launch",
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.w900
                              ),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                child: Text("Login",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w900
                  ),),
              ),
              Text("Your next complimentary meal is just a click away. Let's get started!",
              style: Theme.of(context).textTheme.bodyLarge,),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text("Username", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: ColorUtils.LightGrey,
                                fontSize: 16
                              ),),
                            ),
                            TextFormField(
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: ColorUtils.Grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                              ),
                              onChanged: (value) {},
                              obscureText: false,
                              decoration: InputDecoration(
                                filled: false,
                                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontSize: 16
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorUtils.Grey), // Color of the border
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorUtils.Grey
                                  ), // Color of the border
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorUtils.Green), // Color of the border
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text("Password", style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: ColorUtils.LightGrey,
                                  fontSize: 16
                              ),),
                            ),
                            TextFormField(
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: ColorUtils.Grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                              ),
                              onChanged: (value) {},
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: false,
                                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontSize: 16
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorUtils.Grey), // Color of the border
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorUtils.Grey
                                  ), // Color of the border
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: ColorUtils.Green), // Color of the border
                                ),
                                suffixIcon: Image.asset("assets/icons/icon-eye.png", height: 10, width: 10, fit: BoxFit.contain,),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomButton(onPress: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginOptions()));
                        }, buttonText: "Login", buttonColor: ColorUtils.Green, textColor: ColorUtils.White,),
                      ),

                      Row(
                        children: [
                          Text('Forgot password ?',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorUtils.LightGrey,
                            fontSize: 16
                          ),),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: CustomButton(onPress: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginOptions()));
                            }, buttonText: "Reset Here", buttonColor: Colors.transparent, textColor: ColorUtils.Green, padding: EdgeInsets.zero, fontSize: 13,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Don't have an account ?",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorUtils.Grey,
                          fontSize: 16
                        ),),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomButton(onPress: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup()));
                        }, buttonText: "Create an account", buttonColor: ColorUtils.Yellow, textColor: ColorUtils.Grey,),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}