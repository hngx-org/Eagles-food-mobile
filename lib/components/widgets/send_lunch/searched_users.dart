import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../configs/colors.dart';
import '../../../screens/send_lunch/send_lunch_screen.dart';

class SearchedUsers extends StatefulWidget {
  const SearchedUsers({
    super.key,
    required this.list,
    required this.isLoading,
  });
  // ignore: prefer_typing_uninitialized_variables
  final list;
  final bool isLoading;

  @override
  State<SearchedUsers> createState() => _SearchedUsersState();
}

class _SearchedUsersState extends State<SearchedUsers> {
  @override
  Widget build(BuildContext context) {
    if (widget.list.length > 0) {
      return Expanded(
        child: ListView.builder(
          itemCount: widget.list.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          itemBuilder: (context, index) {
            final item = widget.list[index];
            return SizedBox(
                width: double.infinity,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(item.image),
                  ),
                  title: Text(
                    item.name,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    '${item.email}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 11),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ColorUtils.Green
                        : ColorUtils.Yellow,
                    child: TextButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus
                            ?.unfocus(); // dismiss keyboard if open
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendLunchScreen(
                                      receiver: item,
                                    )));
                      },
                      child: Text(
                        'Send Lunch',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                    ),
                  ),
                ));
          },
        ),
      );
    } else {
      return widget.isLoading
          ? Center(
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                child: CupertinoActivityIndicator(
                  radius: 16,
                  color: ColorUtils.Green,
                ),
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("No User found",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            );
    }
  }
}
