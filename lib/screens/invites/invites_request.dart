// place where an org can see al the request people have made to join the organisation
import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/invitesShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/org_request.dart';
import 'package:hng_task3/models/org_request.dart';
import 'package:hng_task3/providers/OrganizationProvider.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/invites/invites.dart';

class InviteRequest extends StatefulWidget {
  const InviteRequest({super.key});

  @override
  State<InviteRequest> createState() => _InviteRequestState();
}

class _InviteRequestState extends State<InviteRequest> {
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  List<OrgRequest> filtered = [];
  List<OrgRequest> request = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    request = Provider.of<OrganizationProvider>(context).org_request;
    isLoading = Provider.of<OrganizationProvider>(context).isLoading;

    // List<OrgRequest> filtered = request
    //     .where((team) =>
    //     team.name.toLowerCase().contains(_searchQuery.toLowerCase()))
    //     .toList();
    //
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextFormField(
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
                  // search(value);
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
            isLoading
                ? ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (context, index) => const InviteShimmer())
                : request.isEmpty
                    ? Container(
                        padding: const EdgeInsets.symmetric(vertical: 100),
                        alignment: Alignment.center,
                        child: Text(
                          "You have no request at this time",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : ListView.builder(
                        itemCount: request.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemBuilder: (context, index) {
                          final item = request[index];
                          return Invitations(
                            invite: item,
                          );
                        },
                      )
          ],
        ),
      ),
    );
  }
}
