import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/InvitesProvider.dart';
import 'package:hng_task3/screens/invites/invites.dart';
import 'package:hng_task3/screens/invites/invites_reply_success.dart';
import 'package:hng_task3/utils/date_extension.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';
class Invitations extends StatelessWidget {
  const Invitations({super.key, this.invite});
 final invite;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorUtils.LightGrey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(invite.org,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 18,
                      color:ColorUtils.Black,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    "Sent on ${DateTime.parse(invite.createdAt).formatToDate}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorUtils.Green,
                      fontWeight: FontWeight.w500
                    ),
                  )

                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomButton(
                  onPress: ()  async {
                    dynamic data = {
                      "inviteId": invite.id,
                      "status": true
                    };
                    Utils.loadingProgress(context);
                    final response = await Provider.of<InvitesProvider>(context, listen: false).replyInvite(data);
                    Navigator.pop(context);
                    if(response){
                        Provider.of<AuthProvider>(context, listen: false).updateUserOrg(invite.org, invite.orgId);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              InviteReplySuccess(team: invite))
                        );
                    }
                  },
                  buttonText: "Accept",
                  buttonColor: ColorUtils.Green,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  textColor: ColorUtils.White,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CustomButton(
                  onPress: () async {
                    dynamic data = {
                      "inviteId": invite.id,
                      "status": false
                    };
                    Utils.loadingProgress(context);
                    final response = await Provider.of<InvitesProvider>(context, listen: false).replyInvite(data);
                    if(response){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Invites()));
                    }
                  },
                  buttonText: "Decline",
                  buttonColor: ColorUtils.Red,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  textColor: ColorUtils.White,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
