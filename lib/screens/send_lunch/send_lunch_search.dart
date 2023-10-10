import 'package:flutter/material.dart';
import 'package:hng_task3/components/widgets/send_lunch/navigationwidget.dart';
import 'package:hng_task3/configs/colors.dart';

import 'send_multi_lunch_screen.dart';

class SendLunchSearch extends StatefulWidget {
  const SendLunchSearch({super.key});

  @override
  State<SendLunchSearch> createState() => _SendLunchSearchState();
}

class _SendLunchSearchState extends State<SendLunchSearch> {
  FocusNode myFocusNode = FocusNode();
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        titleSpacing: 10,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Image.asset(
                "assets/icons/icon-back.png",
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                "Send Lunch",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SendMultiLunchScreen(),
                    ),
                  );
                },
                child: Image.asset(
                  "assets/images/withdraw_plus.png",
                  height: 18,
                  width: 18,
                  fit: BoxFit.contain,
                  color: ColorUtils.Black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: TextFormField(
              focusNode: myFocusNode,
              controller: searchController,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                hintText: 'Search for member',
                filled: true,
                fillColor:
                    Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorUtils.LightGrey, fontWeight: FontWeight.w500),
                suffixIcon: Icon(
                  Icons.search,
                  color: ColorUtils.LightGrey,
                  size: 30,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorUtils.LightGrey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorUtils.LightGrey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: ColorUtils.LightGrey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: NavigationScreenWidget(
              search: _searchQuery,
            ),
          ),
        ],
      ),
    );
  }
}
