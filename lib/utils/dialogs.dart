import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/OrganizationProvider.dart';
import 'package:hng_task3/screens/home/home_screen.dart';
import 'package:hng_task3/screens/home/menu/nav_screen.dart';
import 'package:hng_task3/screens/onboarding/auth/auth_home.dart';
import 'package:hng_task3/utils/utils.dart';
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
                    // ignore: deprecated_member_use
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

  static leaveOrgDialog(
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
                  // ignore: deprecated_member_use
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
                          child: Text("Leave Organization",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold
                            ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Expanded(
                          child: Text("Are you sure you want to leave your current organization?",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400
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
                                  onPress: () async  {
                                    Utils.loadingProgress(context);
                                    print('befire request in dialog');
                                    final response = await Provider.of<OrganizationProvider>(context, listen: false).leaveOrg();
                                    print('Response: $response');
                                    // if (!context.mounted) return;
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    if (response == true) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const NavScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  buttonText: "Yes Leave",
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