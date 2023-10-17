import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/onboarding/auth/auth_home.dart';
import 'package:provider/provider.dart';

class Dialogs {

  static logoutDialog(
      {context,
      }) async {
    return (await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Container(
                alignment: Alignment.center,
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)
                    )
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Expanded(
                          child: Text("Are you sure you want to logout?",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: CustomButton(
                                  onPress: () {
                                    Navigator.pop(context);
                                  },
                                  buttonText: "Cancel",
                                  buttonColor: ColorUtils.Grey,
                                  fontSize: 13,
                                  textColor: ColorUtils.White,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: CustomButton(
                                  onPress: () {
                                    Provider.of<AuthProvider>(context, listen: false).logout();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const AuthHome(),
                                        ), (route) => false
                                    );
                                  },
                                  buttonText: "Logout",
                                  buttonColor: ColorUtils.Red,
                                  fontSize: 13,
                                  textColor: ColorUtils.White,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )

                    ]
                )),
          );
        })
    ) ?? false;
  }
}