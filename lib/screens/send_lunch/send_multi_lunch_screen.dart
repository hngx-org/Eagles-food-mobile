import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/utils/toast.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_success.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class SendMultiLunchScreen extends StatefulWidget {
  const SendMultiLunchScreen({super.key});

  @override
  State<SendMultiLunchScreen> createState() => _SendMultiLunchScreenState();
}

class _SendMultiLunchScreenState extends State<SendMultiLunchScreen> {
  final TextEditingController _firstEmailController = TextEditingController();
  final TextEditingController _secondEmailController = TextEditingController();
  final TextEditingController _thirdEmailController = TextEditingController();

  Map<String, dynamic> lunchData = {
    "receivers": [],
    "quantity": '',
    "note": ''
  };
  User? user;

  final _formKey = GlobalKey<FormState>();

  // Regular expression to match a valid email address pattern
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  Future<void> _sendLunch() async {
    FocusManager.instance.primaryFocus?.unfocus(); // dismiss keyboard
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final firstEmail = _firstEmailController.text;
      final secondEmail = _secondEmailController.text;
      final thirdEmail = _thirdEmailController.text;
      int noOfLunch;
      Utils.loadingProgress(context);
      lunchData['receivers'] = [
        if (firstEmail != '') firstEmail,
        if (secondEmail != '') secondEmail,
        if (thirdEmail != '') thirdEmail
      ];

      noOfLunch = lunchData['receivers'].length;
      int debit = int.parse(lunchData['quantity']) * noOfLunch;
      var balanceAmt = int.parse(user?.lunchCreditBalance as String) - debit;

      final response =
          await Provider.of<TeamAndLunchProvider>(context, listen: false)
              .sendLunch(lunchData);

      if (!context.mounted) return;
      Navigator.pop(context);
      if (response == true) {
        Provider.of<AuthProvider>(context, listen: false)
            .updateUserLunch(balanceAmt.toString());
        Toasts.showToast(ColorUtils.Green, "Lunch sent successfully");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SendLunchSuccess(noOfLunches: debit.toString()),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        titleSpacing: 10,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Image.asset(
            "assets/icons/icon-back.png",
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Body
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                              'Send Lunch to More Members at the same time',
                              style: Theme.of(context).textTheme.displayMedium),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            '${user?.orgName} Member',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.grey[700]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'Add up to 3 members to send lunch to:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: TextFormField(
                            controller: _firstEmailController,
                            onSaved: (value) {
                              lunchData['receivers']?.add(value);
                            },
                            validator: (value) {
                              if (value == '' &&
                                  _secondEmailController.text == '' &&
                                  _thirdEmailController.text == '') {
                                return 'Enter at least one email address';
                              }
                              if (value != '' && !emailRegex.hasMatch(value!)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              hintText: "Enter 1st member's email address",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: TextFormField(
                            controller: _secondEmailController,
                            onSaved: (value) {
                              lunchData['receivers']?.add(value);
                            },
                            validator: (value) {
                              if (value == '' &&
                                  _firstEmailController.text == '' &&
                                  _thirdEmailController.text == '') {
                                return 'Enter at least one email address';
                              }
                              if (value != '' && !emailRegex.hasMatch(value!)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              hintText: "Enter 2nd member's email address",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: TextFormField(
                            controller: _thirdEmailController,
                            onSaved: (value) {
                              lunchData['receivers']?.add(value);
                            },
                            validator: (value) {
                              if (value == '' &&
                                  _firstEmailController.text == '' &&
                                  _secondEmailController.text == '') {
                                return 'Enter at least one email address';
                              }
                              if (value != '' && !emailRegex.hasMatch(value!)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              hintText: "Enter 3rd member's email address",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'Number of Free Lunch:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == '') {
                                  return 'Enter number of free lunches';
                                }
                                if (int.parse(value!) >
                                    int.parse(
                                        user?.lunchCreditBalance as String)) {
                                  return 'You do not have enough free lunches';
                                }
                                return null;
                              },
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: ColorUtils.Grey,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                              onChanged: (value) {
                                setState(() {
                                  lunchData['quantity'] = value;
                                });
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 10),
                                  child: Text(
                                    lunchData['quantity'] == '1'
                                        ? 'Free lunch'
                                        : 'Free lunches',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorUtils.Green,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorUtils.Green,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorUtils.Green,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorUtils.Green,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            )),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Your are left with ",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    // color: ColorUtils.Black
                                  ),
                            ),
                            Text(
                              " ${user?.lunchCreditBalance} ",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ColorUtils.Green),
                            ),
                            Text(
                              " free lunches",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'Reward Reason:',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: ColorUtils.Grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                            onChanged: (value) {
                              lunchData['note'] = value;
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorUtils.Green,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            'By tapping "send lunch" below, you choose to reward recipient with the stipulated number of lunch',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey[700]),
                          ),
                        ),

                        // Send Lunch Button
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                minimumSize: const Size.fromHeight(60),
                                backgroundColor: const Color(0xFF04754D)),
                            onPressed: _sendLunch,
                            child: Text(
                              "SEND LUNCH",
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorUtils.White,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
