import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/providers/InvitesProvider.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';
class InviteSend extends StatelessWidget {
  const InviteSend({super.key, this.item});
  final item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.email,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  item.status == true ? 'Accepted' : item.status == false ? 'Declined' : 'Pending',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                      color: ColorUtils.DeepPink,
                      fontWeight: FontWeight.w500,
                      fontSize: 11
                  ),
                ),
              ],
            ),
          ),
          // CustomButton(
          //   onPress: () async {
          //     dynamic data = {
          //       // "inviteId": invite.id,
          //       "status": false
          //     };
          //     Utils.loadingProgress(context);
          //     final response = await Provider.of<InvitesProvider>(context, listen: false).cancelOrgInvite(data);
          //     if(response){
          //
          //     }
          //   },
          //   buttonText: "Cancel Invite",
          //   buttonColor: ColorUtils.Red,
          //   fontSize: 14,
          //   fontWeight: FontWeight.w400,
          //   fontFamily: 'Poppins',
          //   textColor: ColorUtils.White,
          //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          // ),

        ],
      ),
    );
  }
}
