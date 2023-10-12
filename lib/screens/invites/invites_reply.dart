import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/components/widgets/invites/invite_history.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/sentInvite.dart';

class InvitesReply extends StatefulWidget {
  InvitesReply({super.key, required this.invites, this.page});
  List<SendInvite> invites;
  final page;
  @override
  State<InvitesReply> createState() => _InvitesReplyState();
}

class _InvitesReplyState extends State<InvitesReply> {
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {

    List<SendInvite> filterdInvites = widget.invites
        .where((invites) =>
        invites.org.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

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
                widget.page ?? '',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   child: TextFormField(
            //     style: Theme.of(context).textTheme.bodyLarge,
            //     controller: searchController,
            //     decoration: InputDecoration(
            //       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //       hintText: 'Search history',
            //       filled: true,
            //       fillColor: Theme.of(context).unselectedWidgetColor.withOpacity(0.2),
            //       hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //           color: ColorUtils.LightGrey,
            //           fontWeight: FontWeight.w500
            //       ),
            //       suffixIcon: Icon(Icons.search, color: ColorUtils.LightGrey, size: 30,),
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           width: 1,
            //           color: ColorUtils.LightGrey,
            //         ),
            //         borderRadius: const  BorderRadius.all(Radius.circular(30)),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           width: 1,
            //           color: ColorUtils.LightGrey,
            //         ),
            //         borderRadius: const  BorderRadius.all(Radius.circular(30)),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           width: 1,
            //           color: ColorUtils.LightGrey,
            //         ),
            //         borderRadius: const  BorderRadius.all(Radius.circular(50)),
            //       ),
            //     ),
            //     onChanged: (value) {
            //       setState(() {
            //         _searchQuery = value;
            //       });
            //     },
            //   ),
            // ),

            widget.invites.isEmpty
                ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "No invites available",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: ColorUtils.LightGrey),
              ),
            )
                : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filterdInvites.length,
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 15),
              itemBuilder: (context, index) {
                final item = filterdInvites[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.email as String,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              item.status == true ? 'Accepted' : item.status == false ? 'Declined' : 'Pending',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                  color: ColorUtils.DeepPink,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
