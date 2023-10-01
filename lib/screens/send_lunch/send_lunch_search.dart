import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/widgets/send_lunch/navigationwidget.dart';

class SendLunchSearch extends StatefulWidget {
  const SendLunchSearch({super.key});

  @override
  State<SendLunchSearch> createState() => _SendLunchSearchState();
}

class _SendLunchSearchState extends State<SendLunchSearch> {
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
                Navigator.pop(context);
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
        children:  [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                hintText: 'Search for employee',
                filled: true,
                fillColor: Theme.of(context).unselectedWidgetColor,
                hintStyle:
                const TextStyle(color: Colors.grey, fontWeight: FontWeight.w100),
                suffixIcon: Icon(Icons.search, color: ColorUtils.Grey.withOpacity(0.5)),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              onChanged: (value) {
                // Perform search operations based on the entered value
                // Update the search results accordingly
              },
            ),
          ),
          const Expanded(
            child: NavigationScreenWidget(),
          ),
        ],
      ),
    );
  }
}
