import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/utils/toast.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_success.dart';
import 'package:provider/provider.dart';

class SendLunchScreen extends StatefulWidget {
  const SendLunchScreen({super.key, this.receiver});
  final receiver;

  @override
  State<SendLunchScreen> createState() => _SendLunchScreenState();
}

class _SendLunchScreenState extends State<SendLunchScreen> {
  Map<String, dynamic> lunchData = {
    "receivers": [],
    "quantity": '',
    "note": ''
  };
  var user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    return Scaffold(
      backgroundColor: ColorUtils.Green,
      appBar: AppBar(
        titleSpacing: 10,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: ColorUtils.Green,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
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
            Padding(
              padding: const EdgeInsets.only(left: 56),
              child: Text(
                "Send Lunch",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
      body: Align(
        // heightFactor: MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Avatar
              Stack(
                children: [
                  Positioned(
                      bottom: 7,
                      right: 40,
                      child: Image.asset('assets/images/arrow.png')),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/man-avatar.png')),
                ],
              ),

              //Body
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                          child: Image.asset('assets/images/handler.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(widget.receiver.name,
                          style: Theme.of(context).textTheme.displayMedium),
                    ),
                    // style: Theme.of(context).textTheme.displayLarge,  ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        '${user.orgName} Member',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey[700]),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Number of Free Lunch:',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
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
                          keyboardType: TextInputType.number,
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Your are left with ",
                          textAlign: TextAlign.left,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    // color: ColorUtils.Black
                                  ),
                        ),
                        Text(
                          " ${user.lunchCreditBalance} ",
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    // color: ColorUtils.Black
                                  ),
                        ),
                      ],
                    ),

                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Reward Reason:',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.black
                                  ),
                        )),
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
                          keyboardType: TextInputType.emailAddress,
                        )),

                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
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
                        onPressed: () async {
                          Utils.loadingProgress(context);
                          lunchData['receivers'] = ["${widget.receiver.email}"];
                          var balanceAmt =
                              int.parse(user.lunchCreditBalance as String) -
                                  int.parse(lunchData['quantity']);
                          final response =
                              await Provider.of<TeamAndLunchProvider>(context,
                                      listen: false)
                                  .sendLunch(lunchData);
                          if (!context.mounted) return;
                          Navigator.pop(context);
                          if (response == true) {
                            Provider.of<AuthProvider>(context, listen: false)
                                .updateUserLunch(balanceAmt.toString());
                            Toasts.showToast(
                                Colors.green, "Lunch sent successfully");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SendLunchSuccess(
                                  noOfLunches: lunchData['quantity'],
                                ),
                              ),
                            );
                          }
                        },
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
            ],
          ),
        ),
      ),
    );
  }
}
