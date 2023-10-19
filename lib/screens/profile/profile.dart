import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/profile/settings.dart';
import 'package:hng_task3/utils/dialogs.dart';
import 'package:provider/provider.dart';

import '../../providers/OrganizationProvider.dart';
import '../home/home_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedEmployee = '';
  FocusNode focusNode = FocusNode();

  User? user;
  String? orgName;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AuthProvider>(context, listen: false).getUserOrg();
    Provider.of<AuthProvider>(context, listen: false).getUserProfile();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    orgName = Provider.of<AuthProvider>(context).userOrg;
    print(user?.profilePic);
    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorUtils.Green,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w900, color: ColorUtils.White),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ));
                    },
                    icon: Icon(
                      Icons.settings,
                      color: ColorUtils.White,
                    ))),
          ],
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar
                    Container(
                      height: 230,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/withdrawal-bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          user?.profilePic == null
                              ? Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: ColorUtils.LightGrey),
                                    borderRadius: BorderRadius.circular(100),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/man-avatar-icon.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 3, color: ColorUtils.LightGrey),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: FadeInImage(
                                      placeholder: const AssetImage(
                                          "assets/icons/man-avatar-icon.png"),
                                      image: NetworkImage(
                                        user?.profilePic ??
                                            'assets/icons/man-avatar-icon.png',
                                      ),
                                      fit: BoxFit.cover,
                                      height: 130,
                                      width: 130,
                                      filterQuality: FilterQuality.high,
                                      imageErrorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 3,
                                              color: ColorUtils.LightGrey),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/man-avatar-icon.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          // Name

                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Text(
                              user?.firstName == null && user?.lastName == null
                                  ? "Full Name"
                                  : "${user?.firstName} ${user?.lastName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 28,
                                    color: ColorUtils.White,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          // Organization Name

                          Consumer<AuthProvider>(
                            builder: (context, provider, child) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  provider.userOrg == ''
                                      ? "Default Organization"
                                      : provider.userOrg.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        color: ColorUtils.White,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    // Phone Number
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: ColorUtils.Grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                user?.phone == null
                                    ? "Phone Number"
                                    : "${user?.phone}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Email address
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: ColorUtils.Grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                user?.email == null
                                    ? "Email Address"
                                    : "${user?.email}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (orgName != '' || false)
                TextButton(
                  onPressed: () {
                    Dialogs.leaveOrgDialog(context: context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorUtils.Red,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Leave Org",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: ColorUtils.White),
                        )),
                  ),
                ),
              TextButton(
                onPressed: () {
                  Dialogs.logoutDialog(context: context);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorUtils.Red,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Logout",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: ColorUtils.White),
                      )),
                ),
              ),
            ]));
  }
}
