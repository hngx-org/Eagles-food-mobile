import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
class LeaderBoardWidget extends StatelessWidget {
  const LeaderBoardWidget({super.key, this.item, this.index});
  final item;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: index == 0 ? ColorUtils.Red: index == 1 ? ColorUtils.Green : index == 2 ? ColorUtils.Yellow : ColorUtils.LightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: index == 0 || index == 1 || index == 2 ? ColorUtils.White : ColorUtils.Grey,
                    fontSize: 18
                  ),
                ),
                Text(
                  item.email,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: index == 0 || index == 1 || index == 2 ? ColorUtils.White : ColorUtils.Grey,
                  )
                ),
              ],
            ),
          ),
          Text(
            item.quantity.toString(),
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: index == 0 || index == 1 || index == 2 ? ColorUtils.White : ColorUtils.Grey,
            ),
          ),
        ],
      ),
    );
  }
}
