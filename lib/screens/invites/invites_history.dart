import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/components/widgets/invites/invite_history.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/home/menu/components/nav_screen.dart';
import 'package:hng_task3/screens/invites/invites_reply.dart';

class InvitesHistory extends StatefulWidget {
  const InvitesHistory({super.key});

  @override
  State<InvitesHistory> createState() => _InvitesHistoryState();
}

class _InvitesHistoryState extends State<InvitesHistory> {
  List list = [];
  @override
  Widget build(BuildContext context) {
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
              child: Text(
                "Invite History",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: ColorUtils.Green,
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/withdrawal-bg.png',
                    ),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: ColorUtils.Yellow,
                    blurRadius: 0,
                    offset: const Offset(7, 7),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total Invites',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: ColorUtils.White,
                                ),
                      ),
                      const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "35",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InvitesReply()));
                        },
                        fontSize: 14,
                        buttonText: 'Invites Accepted',
                        buttonColor: ColorUtils.DeepPink,
                        textColor: ColorUtils.Black,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InvitesReply()));
                        },
                        fontSize: 14,
                        buttonText: 'Invites Declined',
                        buttonColor: ColorUtils.Yellow,
                        textColor: ColorUtils.Black,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      )),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Invites Pending",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
            list.isEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (context, index) => const TeamShimmer())
                : ListView.builder(
                    itemCount: 5,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return InviteHistory();
                    },
                  )
          ],
        ),
      ),
    );
  }
}
