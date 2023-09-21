import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/menu/configurations.dart';

import '../../utils/assets/assets.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen(
      {super.key,
      required this.closeDrawer,
      required this.selectedItem,
      required this.selectPage});
  final DrawerItem selectedItem;
  final VoidCallback closeDrawer;
  final Function(DrawerItem item) selectPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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

                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: IconButton(
                        onPressed: closeDrawer, icon: const Icon(Icons.close)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: DrawerItems.all
                    .map((item) => SizedBox(
                          width: 150,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: 3,
                            ),
                            onTap: () => selectPage(item),
                            leading: Icon(
                              item.icon,
                              color: selectedItem == item
                                  ? ColorUtils.Green
                                  : ColorUtils.Black.withOpacity(0.5),
                            ),
                            title: Text(
                              item.title,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: selectedItem == item
                                        ? ColorUtils.Green
                                        : ColorUtils.Black,
                                  ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 140,
              ),
              const Row(
                children: [
                  Text(
                    "Free Lunch App",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: "Poppins",
                      color: Color(0xFF868686),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "App version 1.0.0",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: "Poppins",
                      color: Color(0xB2B1B1C3),
                    ),
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
