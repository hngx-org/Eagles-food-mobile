import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

import '../../utils/assets/assets.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.logoGreen),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Free lunch',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Main menu",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  // const Spacer(),

                  const Padding(
                    padding: EdgeInsets.only(right: 50.0),
                    child: Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: <Widget>[
                  const NewRow(
                    text: 'Home',
                    icon: Icons.home_filled,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const NewRow(
                    text: 'Send Lunch',
                    icon: Icons.send,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const NewRow(
                    text: 'Withdraw Lunch',
                    icon: Icons.receipt,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const NewRow(
                    text: 'Profile',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      ImageIcon(AssetImage(Assets.logouticon),),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Logout",
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      Text("Free Lunch App"),
                    ],
                  ),
                  const Row(
                    children: [
                      Text("App version 1.0.0"),
                    ],
                  ),
                ],
              ),
              const Row(
                children: <Widget>[],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const NewRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: ColorUtils.Black.withOpacity(0.5),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          softWrap: true,
          maxLines: 10,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorUtils.Black),
        )
      ],
    );
  }
}
