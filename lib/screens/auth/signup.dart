import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/screens/menu/components/nav_screen.dart';
import 'package:hng_task3/utils/toast.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:hng_task3/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final userData = {
    "firstName": '',
    "lastName": "",
    "email": "",
    "address": "",
    "phone": '',
    "password": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Free Launch",
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
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                  child: Text(
                    "Create an account",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                ),
                Text(
                  "Sign up today to be a part of a delicious community where you can send and receive free lunches",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "First Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.LightGrey,
                                          fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: ColorUtils.Grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                onChanged: (value) {
                                  userData['firstName'] = value;
                                },
                                obscureText: false,
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                                keyboardType: TextInputType.text,
                              )
                            ],
                          ),
                        ),
                        // TODO Remove the last name field.
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Last Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.LightGrey,
                                          fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: ColorUtils.Grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                onChanged: (value) {
                                  userData['lastName'] = value;
                                },
                                obscureText: false,
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                keyboardType: TextInputType.text,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Email",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.LightGrey,
                                          fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: ColorUtils.Grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                onChanged: (value) {
                                  userData['email'] = value;
                                },
                                obscureText: false,
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
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.LightGrey,
                                          fontSize: 16),
                                ),
                                // keyboardType: TextInputType.number,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Street Address",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.LightGrey,
                                          fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: ColorUtils.Grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                onChanged: (value) {
                                  userData['address'] = value;
                                },
                                obscureText: false,
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
                                  suffixIcon: Image.asset(
                                    "assets/icons/icon-eye.png",
                                    height: 10,
                                    width: 10,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                                keyboardType: TextInputType.streetAddress,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  "Password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.LightGrey,
                                          fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: ColorUtils.Grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                onChanged: (value) {
                                  userData['password'] = value;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: false,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: ColorUtils.Grey, fontSize: 16),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Grey), // Color of the border
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: ColorUtils
                                            .Green), // Color of the border
                                  ),
                                  suffixIcon: Image.asset(
                                    "assets/icons/icon-eye.png",
                                    height: 10,
                                    width: 10,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CustomButton(
                              onPress: () async {
                                Utils.loadingProgress(context);
                                final response =
                                    await Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .register(userData);
                                Navigator.pop(context);
                                if (response) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavScreen()));
                                  Toasts.showToast(
                                      Colors.green, 'Signup Successful');
                                }
                              },
                              buttonText: "Sign Up",
                              buttonColor: ColorUtils.Green,
                              textColor: ColorUtils.White,
                              isUppercase: true),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Sign up today to be a part of a delicious community where you can send and receive free lunches',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: ColorUtils.Black, fontSize: 16),
                          ),
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
