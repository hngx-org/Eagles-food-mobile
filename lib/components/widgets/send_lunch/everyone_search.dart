import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/screens/send_lunch/send_lunch_screen.dart';

class EveryoneSearch extends StatefulWidget {
  const EveryoneSearch({super.key, this.list});
  final list;

  @override
  State<EveryoneSearch> createState() => _EveryoneSearchState();
}

class _EveryoneSearchState extends State<EveryoneSearch> {
  @override
  Widget build(BuildContext context) {
    if (widget.list.length > 0) {
      return widget.list.length == 0
          ? ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 0),
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              itemBuilder: (context, index) => const TeamShimmer())
          : ListView.builder(
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
                            ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      subtitle: Text(
                        '${item.email}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 11),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        color: ColorUtils.Yellow,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SendLunchScreen(
                                          receiver: item,
                                        )));
                          },
                          child: Text(
                            'Send Lunch',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w700, fontSize: 13),
                          ),
                        ),
                      ),
                    ));
              },
            );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text("No User found",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
      );
    }
  }
}
