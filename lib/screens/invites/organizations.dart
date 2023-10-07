// list of organisations for people to request invite
import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/organization.dart';
import 'package:hng_task3/models/team.dart';
import 'package:hng_task3/providers/OrganizationProvider.dart';
import 'package:hng_task3/providers/OrganizationProvider.dart';
import 'package:provider/provider.dart';
class Organizations extends StatefulWidget {
  const Organizations({super.key});

  @override
  State<Organizations> createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations> {
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  //change to org later
  List<Organization> filtered = [];
  List<Organization> list = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    list = Provider.of<OrganizationProvider>(context).organizations;
    isLoading = Provider.of<OrganizationProvider>(context).isLoading;

    // List<Organization> filtered = list
    //     .where((team) =>
    //     team.name.toLowerCase().contains(_searchQuery.toLowerCase()))
    //     .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Request To Join",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child:
              // Search bar
              TextFormField(
                controller: searchController,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: 'Search for organization',
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
            Text(
              "Send an invite for someone to join your team",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: ColorUtils.LightGrey),
            ),
            isLoading
                ? ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 0),
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => const TeamShimmer())
                :
            filtered.isEmpty ? Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "No organisation found",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: ColorUtils.LightGrey),
              ),
            ) :
            ListView.builder(
              itemCount: filtered.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                final item = filtered[index];
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
