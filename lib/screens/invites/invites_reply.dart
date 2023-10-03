import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/components/widgets/invites/invite_history.dart';
import 'package:hng_task3/configs/colors.dart';

class InvitesReply extends StatefulWidget {
  const InvitesReply({super.key});

  @override
  State<InvitesReply> createState() => _InvitesReplyState();
}

class _InvitesReplyState extends State<InvitesReply> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                "Invite History",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Invites Accepted",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: 'Search for member',
                  filled: true,
                  fillColor: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorUtils.LightGrey,
                      fontWeight: FontWeight.w500
                  ),
                  suffixIcon: Icon(Icons.search, color: ColorUtils.LightGrey, size: 30,),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ColorUtils.LightGrey,
                    ),
                    borderRadius: const  BorderRadius.all(Radius.circular(30)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ColorUtils.LightGrey,
                    ),
                    borderRadius: const  BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ColorUtils.LightGrey,
                    ),
                    borderRadius: const  BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                onChanged: (value) {
                  // search(value);
                },
              ),
            ),
            Text("You can modify accepted team members here",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.LightGrey
              ),),

            list.isEmpty
                ? ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => const TeamShimmer())
                : ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                final item = list[index];
                return InviteHistory();
              },
            )
          ],
        ),
      ),
    );
  }
}
