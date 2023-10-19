// list of organisations for people to request invite
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/components/shimmers/invitesShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/organization.dart';
import 'package:hng_task3/providers/OrganizationProvider.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../utils/toast.dart';

class Organizations extends StatefulWidget {
  const Organizations({super.key});

  @override
  State<Organizations> createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations>
    with WidgetsBindingObserver {
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  //change to org later
  List<Organization> filtered = [];
  List<Organization> list = [];
  bool isLoading = false;

  bool end_reached = false;
  int page = 1;

  bool isFetchingOrgs = false;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrganizationProvider>(context, listen: false)
        .getOrganizations(page: page, process: 'initial');
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool initialFetchOrg = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      SessionManager ss = SessionManager();
      ss.setInitialFetchOrg(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    list = Provider.of<OrganizationProvider>(context).organizations;
    isLoading = Provider.of<OrganizationProvider>(context).isLoading;
    isFetchingOrgs = Provider.of<OrganizationProvider>(context).isFetchingOrgs;

    List<Organization> filtered = list
        .where((team) =>
            team.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
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
      body: RefreshIndicator(
        displacement: 50,
        backgroundColor: ColorUtils.Green,
        color: ColorUtils.White,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          Provider.of<OrganizationProvider>(context, listen: false)
              .getOrganizations(page: 1, process: 'refresh');
          setState(() {
            isLoading = true;
          });
        },
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
              "Request to join an organisation",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: ColorUtils.LightGrey),
            ),
            isLoading
                ? Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 15),
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) => const InviteShimmer()),
                  )
                : filtered.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "No organisation found",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: ColorUtils.LightGrey),
                        ),
                      )
                    : NotificationListener<ScrollEndNotification>(
                        onNotification: (scrollEnd) {
                          var metrics = scrollEnd.metrics;
                          if (metrics.atEdge) {
                            if (metrics.pixels != 0) {
                              setState(() {
                                end_reached = true;
                                page++;
                              });
                              Provider.of<OrganizationProvider>(context,
                                      listen: false)
                                  .getOrganizations(
                                      page: page, process: 'refresh');
                            }
                          }
                          return true;
                        },
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: filtered.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            itemBuilder: (context, index) {
                              final item = filtered[index];
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: ColorUtils.LightGrey),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall
                                                ?.copyWith(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Lunch price: ${item.currencyCode} ${item.lunchPrice}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        color: ColorUtils.Green,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    CustomButton(
                                      onPress: () async {
                                        Utils.loadingProgress(context);
                                        final response = await Provider.of<
                                                    OrganizationProvider>(
                                                context,
                                                listen: false)
                                            .requestToJoinOrg(item.id);
                                        if (!context.mounted) return;
                                        Navigator.pop(context);
                                        if (response) {
                                          Toasts.showToast(ColorUtils.Green,
                                              "Request sent successfully");
                                        }
                                      },
                                      buttonText: "Request To Join",
                                      buttonColor: ColorUtils.Green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                      textColor: ColorUtils.White,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 10),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
            if (isFetchingOrgs)
              Container(
                padding: const EdgeInsets.only(bottom: 24),
                width: 25,
                height: 25,
                child: CupertinoActivityIndicator(
                  color: ColorUtils.Green,
                  radius: 15,
                ),
              )
          ],
        ),
      ),
    );
  }
}
