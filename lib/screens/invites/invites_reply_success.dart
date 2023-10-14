import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/home/menu/nav_screen.dart';

class InviteReplySuccess extends StatelessWidget {
  const InviteReplySuccess({super.key, this.team});
  final team;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Image.asset(
                "assets/images/invites_success_img.png",
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Congratulations, you are now in ${team.org}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Text(
                "You have successfully accepted the Invitation to Join Team Eagles, You can access your team members in the “my team” section.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: CustomButton(
                  onPress: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavScreen()),
                        (route) => false);
                  },
                  buttonText: "Continue",
                  buttonColor: ColorUtils.Green,
                  textColor: ColorUtils.White,
                  isUppercase: true),
            ),
          ],
        ),
      ),
    );
  }
}
