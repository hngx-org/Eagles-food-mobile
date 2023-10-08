import 'package:flutter/material.dart';

class InviteHistory extends StatelessWidget {
  const InviteHistory({super.key, this.item});
  final item;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
                child: Image.asset("assets/images/team-1.png", height: 50, fit: BoxFit.cover,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.org,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  item.status == true ? 'Accepted' : item.status == false ? 'Declined' : 'Pending',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 11),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
