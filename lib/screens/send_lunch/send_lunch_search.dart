import 'package:flutter/material.dart';
import 'package:hng_task3/components/widgets/send_lunch/everyone_search.dart';
import 'package:hng_task3/components/widgets/send_lunch/navigationwidget.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/screens/home/menu/nav_screen.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/send_lunch/searched_users.dart';
import '../../models/team.dart';
import 'send_multi_lunch_screen.dart';

class SendLunchSearch extends StatefulWidget {
  const SendLunchSearch({super.key});

  @override
  State<SendLunchSearch> createState() => _SendLunchSearchState();
}

class _SendLunchSearchState extends State<SendLunchSearch> {
  FocusNode searchFocusNode = FocusNode();
  TextEditingController searchController = TextEditingController();

  String _query = '';
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Team>? searchedUsers =
        Provider.of<TeamAndLunchProvider>(context, listen: true).searchedUsers;
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NavScreen()),
                    (route) => false);
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
                  child: Icon(
                    Icons.add,
                    size: 35,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ColorUtils.Green
                        : ColorUtils.Black,
                  )),
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
              controller: searchController,
              onChanged: (value) async {
                setState(() {
                  _query = value;
                  _isSearching = true;
                });
                if (value.contains('@')) {
                  await Provider.of<TeamAndLunchProvider>(context,
                          listen: false)
                      .searchUsersByEmail(_query);
                  setState(() {
                    _isSearching = false;
                  });
                  return;
                }
                await Provider.of<TeamAndLunchProvider>(context, listen: false)
                    .searchUsersByName(_query);
                setState(() {
                  _isSearching = false;
                });
              },
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
                suffixIcon: _query != ''
                    ? InkWell(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          setState(() {
                            searchController.clear();
                            _query = '';
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: ColorUtils.LightGrey,
                          size: 30,
                        ),
                      )
                    : Icon(
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
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          _query != ''
              ? SearchedUsers(
                  list: searchedUsers,
                  isLoading: _isSearching,
                )
              : const Expanded(
                  child: NavigationScreenWidget(),
                ),
        ],
      ),
    );
  }
}
