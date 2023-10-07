import 'package:flutter/material.dart';
import 'package:hng_task3/components/widgets/send_lunch/navigationwidget.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/home/menu/nav_screen.dart';

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
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NavScreen()),
                    (route) => false);
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
                "Send Lunch",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
            )
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
