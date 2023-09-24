import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/providers/num_of_free_lunch_provider.dart';
import 'package:hng_task3/utils/utils.dart';

import 'package:hng_task3/widgets/send_lunch/send_lunch_textfield.dart';
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
    // TODO: implement initState
    super.initState();
    SessionManager().getUser().then((userJson) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          user = User.fromJson(userJson);
        });
      });
    });
  }
  // TextEditingController numOfFreeLunchController = TextEditingController();
  // void updateNumOfFreeLunch(BuildContext context) {
  //   String newNumOfFreeLunches = widget.numOfFreeLunchProvider.numOfFreeLunch;
  //
//     if (numOfFreeLunchController.text.isNotEmpty) {
//       int numOfFreeLunch =
//           widget.numOfFreeLunchProvider.numOfFreeLunch.isNotEmpty
//               ? int.parse(widget.numOfFreeLunchProvider.numOfFreeLunch)
//               : 100;
//       int withdrawAmount = int.parse(numOfFreeLunchController.text);
//       newNumOfFreeLunches = (numOfFreeLunch - withdrawAmount).toString();
//     }

//     widget.numOfFreeLunchProvider.updateNumOfFreeLunches(
//       numOfFreeLunch: newNumOfFreeLunches,
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.Green,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorUtils.Green,
        elevation: 0,
        title: Text(
          'Send Lunch',
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        ),
        leading: SizedBox(
          width: 50,
          height: 50,
          child: IconButton(
            padding: const EdgeInsets.only(left: 10),
            icon: Image.asset("assets/icons/icon-back.png"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: user == null
          ? Center(
              child: Utils.loading(),
            )
          : Align(
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
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Center(
                                child:
                                    Image.asset('assets/images/handler.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(widget.receiver.name,
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          ),
                          // style: Theme.of(context).textTheme.displayLarge,  ),

                          Text(
                            'Band 4 Member',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.grey[700]),
                          ),
                          Text(
                            'Associate Creative Director',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.grey[700]),
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
                                      color: Colors.black),
                            ),
                          ),

                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: ColorUtils.Grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                onChanged: (value) {
                                  lunchData['quantity'] = value;
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10),
                                    child: Text(
                                      "Free Lunches",
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
                                ),
                                keyboardType: TextInputType.emailAddress,
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
                                        color: ColorUtils.Black),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: ColorUtils.Black),
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
                                      color: Colors.black),
                            ),
                          ),

                          //Reward Reason TextField
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
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
                                ),
                                keyboardType: TextInputType.emailAddress,
                              )),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              'By Clicking send lunch, you choose to reward recipient with the stipulated number of lunch',
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
                                  // updateNumOfFreeLunch(context);
                                  //Navigator.push(
                                  Utils.loadingProgress(context);
                                  lunchData['receivers'] = [
                                    "${widget.receiver.id}"
                                  ];
                                  final response =
                                      await Provider.of<TeamAndLunchProvider>(
                                              context,
                                              listen: false)
                                          .sendLunch(lunchData);
                                  print(response);
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const SendLunchSuccess()));
                                },
                                child: Text(
                                  "SEND LUNCH",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorUtils.White,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
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
