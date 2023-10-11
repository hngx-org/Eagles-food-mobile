import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class LeaderBoardShimmer extends StatelessWidget {
  const LeaderBoardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey[300]!,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20, // Representative height
                    width: 200, // Representative width
                    color: Colors.grey,
                  ),
                  Container(
                    height: 14, // Representative height
                    width: 150, // Representative width
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Container(
              height: 36, // Representative height
              width: 50, // Representative width
              color: Colors.grey,
            ),
          ],
        ),
      ),
    )
    ;
  }
}
