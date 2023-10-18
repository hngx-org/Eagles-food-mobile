// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hng_task3/screens/profile/profile.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button.dart';
import '../../configs/colors.dart';
import '../../providers/AuthProvider.dart';
import '../../utils/toast.dart';
import '../../utils/utils.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key, this.user});
  final user;
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final userData = {
    "email": "",
    "oldPassword": "",
    "newPassword": "",
  };
  final _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  bool showOldPassword = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo/logo_green.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Free Lunch",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                  child: Text(
                    "Change password",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Form(
                    key: _formKey,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  "Current password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.LightGrey,
                                          fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                controller: controller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your current password.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  userData['oldPassword'] = value;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: ColorUtils.Grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                obscureText: showOldPassword ? false : true,
                                decoration: InputDecoration(
                                  filled: false,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.Grey, fontSize: 16),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Green), // Color of the border
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showOldPassword = !showOldPassword;
                                        });
                                      },
                                      icon: Iconify(
                                          !showOldPassword
                                              ? Mdi.eye_outline
                                              : Mdi.eye_off_outline,
                                          color: ColorUtils.Green)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                keyboardType: TextInputType.visiblePassword,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  "Enter new password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.LightGrey,
                                          fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a new password.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  userData['newPassword'] = value;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: ColorUtils.Grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                obscureText: showPassword ? false : true,
                                decoration: InputDecoration(
                                  filled: false,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.Grey, fontSize: 16),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.3,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Green), // Color of the border
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                      icon: Iconify(
                                          !showPassword
                                              ? Mdi.eye_outline
                                              : Mdi.eye_off_outline,
                                          color: ColorUtils.Green)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomButton(
                              onPress: () async {
                                FocusManager.instance.primaryFocus
                                    ?.unfocus(); // dismiss keyboard

                                if (_formKey.currentState!.validate()) {
                                  userData["email"] = widget.user.email;
                                  print(userData['email']);
                                  Utils.loadingProgress(context);
                                  print(userData);
                                  final response =
                                      await Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .changePassword(userData);
                                  Navigator.pop(context);
                                  if (response == true) {
                                    Toasts.showToast(Colors.green,
                                        'Password updated successfully');
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              buttonText: "Change password",
                              buttonColor: ColorUtils.Green,
                              textColor: ColorUtils.White,
                              isUppercase: true),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
