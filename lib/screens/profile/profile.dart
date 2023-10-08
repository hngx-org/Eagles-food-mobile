import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/home/menu/nav_screen.dart';
import 'package:hng_task3/screens/profile/change_password.dart';
import 'package:hng_task3/screens/profile/edit_profile.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedEmployee = '';
  FocusNode focusNode = FocusNode();

  bool isLoading = false;
  User? user;

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // SessionManager().getUser().then((userJson) {
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     setState(() {
    //       user = User.fromJson(userJson);
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NavScreen()),
                    (route) => false);
              },
              child: Image.asset(
                "assets/icons/icon-back.png",
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Profile",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(user: user,),
                  ));
            },
            child: Image.asset(
              "assets/icons/icon-edit.png",
              height: 20,
              width: 20,
              color: ColorUtils.Green
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                  child: Image.asset(user?.profilePic ?? '', height: 150, width: 150, fit: BoxFit.cover,)),

              // Name
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 10),
                child: Text(
                  "${user?.firstName} ${user?.lastName}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),

              // Organization Name
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "${user?.orgName ?? ''}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: ColorUtils.Green,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),

              // Phone Number
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      "assets/icons/icon-call.png",
                      height: 30,
                      width: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile Phone',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ColorUtils.Grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      Text(
                        "${user?.phone}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ],
              ),

              // Email address
              Padding(
                padding: const EdgeInsets.only(top: 28),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        "assets/icons/icon-email-green.png",
                        height: 30,
                        width: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorUtils.Grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        Text(
                          "${user?.email}",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Address
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 35),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        "assets/icons/icon-location.png",
                        height: 30,
                        width: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorUtils.Grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        Text(
                          '16th Avenue',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Settings
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomButton(
                    onPress: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePassword(user: user),
                          ));
                    },
                    buttonText: "Change Password",
                    buttonColor: ColorUtils.LightGrey,
                    textColor: ColorUtils.White,
                    isUppercase: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
