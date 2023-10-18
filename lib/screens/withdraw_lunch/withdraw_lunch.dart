import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/screens/home/menu/nav_screen.dart';
import 'package:hng_task3/screens/withdraw_lunch/withdraw_success_screen.dart';
import 'package:hng_task3/utils/toast.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

class WithdrawLunch extends StatefulWidget {
  const WithdrawLunch({
    super.key,
  });

  @override
  State<WithdrawLunch> createState() => _WithdrawLunchState();
}

class _WithdrawLunchState extends State<WithdrawLunch> {
  var convertedAmount = 0.0;
  var amount = 0;
  User? user;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    Provider.of<TeamAndLunchProvider>(context, listen: false)
        .getLunchCreditBalance();

    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 270,
            padding: const EdgeInsets.only(top: 30),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF04764E),
              image: DecorationImage(
                image: AssetImage("assets/images/withdrawal-bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: const Color(0xFFEFCE82),
                    height: 15,
                    width: MediaQuery.of(context).size.width - 20,
                  ),
                ),
                Positioned(
                    right: 30,
                    bottom: -130,
                    child: Image.asset(
                      'assets/images/withdraw_flower.png',
                      height: 270,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NavScreen()),
                                      (route) => false);
                                },
                                child: Image.asset(
                                  "assets/images/withdraw_back_button.png",
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(
                                  "Withdraw Lunch",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            'Available Lunches for withdrawal',
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontSize: 25,
                                    color: ColorUtils.White,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Consumer<TeamAndLunchProvider>(
                            builder: (context, lunchCreditProvider, child) {
                              return Text(
                                lunchCreditProvider.lunchCreditBalance,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(color: ColorUtils.White),
                              );
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
              width: double.infinity,
              // ignore: deprecated_member_use
              color: Theme.of(context).backgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 6,
                      width: 60,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDDDDDD),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                    child: Text('Convert Free Lunches to money',
                        softWrap: true,
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorUtils.LightGreen,
                        borderRadius: BorderRadius.circular(100)),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      cursorColor: const Color(0xFF04764E),
                      onChanged: (value) {
                        setState(() {
                          amount = int.parse(value);
                          convertedAmount = int.parse(value) * 2.5;
                        });
                      },
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          fontFamily: 'poppins'),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: InputBorder.none,
                          suffix: Text(
                              amount == 1 ? 'Free lunch' : 'Free lunches',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: ColorUtils.Green)),
                          hintText: ''),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/withdraw_equal.png',
                        height: 20,
                        color: ColorUtils.Green,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "\$" '$convertedAmount',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: ColorUtils.Green,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Text(
                    'By tapping "withdraw lunch" below, points would be converted into your wallet as money. This process cannot be reversed as all points must be earned',
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorUtils.Grey, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomButton(
                        onPress: () async {
                          if (amount > 0) {
                            var balanceAmt =
                                int.parse(user!.lunchCreditBalance as String) -
                                    amount;
                            print(balanceAmt);
                            Utils.loadingProgress(context);
                            final response =
                                await Provider.of<TeamAndLunchProvider>(context,
                                        listen: false)
                                    .withDrawLunch(amount, balanceAmt);
                            if (!context.mounted) return;
                            Navigator.pop(context);
                            if (response == true) {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .updateUserLunch(balanceAmt.toString());
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      WithdrawSuccessScreen(amount: amount),
                                ),
                              );
                            }
                          } else {
                            Toasts.showToast(
                                ColorUtils.Black, 'Enter number of lunch');
                          }
                        },
                        buttonText: "Withdraw lunch",
                        buttonColor: ColorUtils.DeepPink,
                        textColor: ColorUtils.White,
                        isUppercase: true),
                  ),
                ],
              )),
        ])));
  }
}
