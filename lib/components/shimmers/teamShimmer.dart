import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TeamShimmer extends StatelessWidget {
  const TeamShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: const  CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30.0,
        ),
      ),
      title: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 18.0,
          color: Colors.white,
        ),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 12.0,
          color: Colors.white,
        ),
      ),
      trailing: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          color: Colors.white,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Invite',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
