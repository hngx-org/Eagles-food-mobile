import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/invitesShimmer.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/components/widgets/invites/invites.dart';
import 'package:hng_task3/configs/colors.dart';
class Invites extends StatefulWidget {
  const Invites({super.key});

  @override
  State<Invites> createState() => _InvitesState();
}

class _InvitesState extends State<Invites> {

  List list = [
    {
      "team": "Team Eagle",
      "sender": "Dorcas"
    },
    {
      "team": "Team Demezel",
      "sender": "Mike"
    },
    {
      "team": "Team Commander",
      "sender": "Joyce"
    },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Row(
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
                "Team Invites",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric( vertical: 15),
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
            Text("Accept to Join a Team",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.LightGrey
              ),),

            list.isEmpty ? ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => const InviteShimmer()
            ) : ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                final item = list[index];
                return Invitations(invite: item,);
              },
            )
          ],
        ),
      ),
    );
  }
}
