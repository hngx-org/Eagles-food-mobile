// place where an organization can send request to people via their email
import 'package:flutter/material.dart';
import 'package:hng_task3/components/custom_button.dart';
import 'package:hng_task3/components/shimmers/invitesShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/org_request.dart';
import 'package:hng_task3/providers/OrganizationProvider.dart';
import 'package:hng_task3/screens/home/menu/nav_screen.dart';
import 'package:hng_task3/utils/date_extension.dart';
import 'package:hng_task3/utils/toast.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';
class OrgJoinRequest extends StatefulWidget {
  const OrgJoinRequest({super.key});

  @override
  State<OrgJoinRequest> createState() => _OrgJoinRequestState();
}

class _OrgJoinRequestState extends State<OrgJoinRequest> {
  TextEditingController searchController = TextEditingController();
  String _searchQuery = '';

  @override
  initState() {
    Provider.of<OrganizationProvider>(context, listen: false).getUserJoinRequest();
    super.initState();
  }


  List<OrgRequest> request = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    request = Provider.of<OrganizationProvider>(context).org_request;
    isLoading = Provider.of<OrganizationProvider>(context).isLoading;

    List<OrgRequest> filterdInvites = request
        .where((request) =>
        request.org.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return  Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NavScreen()),
                        (route) => false);
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
                "User Join Request",
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
                  hintText: 'Search for a request',
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
            Text(
              "Accept to Join a Team",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.LightGrey
              ),),
            isLoading ? ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => const InviteShimmer()
            ) :
            request.isEmpty ?  Container(
              padding: const EdgeInsets.symmetric(vertical: 100),
              alignment: Alignment.center,
              child: Text("You have no request at this time",
                style: Theme.of(context).textTheme.bodyLarge,),
            ) :
            ListView.builder(
              itemCount: request.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                final item = request[index];
                return Container(
                  width: double.infinity,
                  height: 130,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: ColorUtils.LightGrey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 0.5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.email,
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              "Sent on ${DateTime.parse(item.createdAt).formatToDate}",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: ColorUtils.Green,
                                  fontWeight: FontWeight.w500
                              ),
                            )

                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPress: ()  async {
                                dynamic data = {
                                  "inviteId": item.id,
                                  "status": true
                                };
                                Utils.loadingProgress(context);
                                final response = await Provider.of<OrganizationProvider>(context, listen: false).toggleJoinRequest(data);
                                if(response){
                                  Navigator.pop(context);
                                  Toasts.showToast(ColorUtils.Green, "Request accepted successfully");
                                }
                              },
                              buttonText: "Accept",
                              buttonColor: ColorUtils.Green,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              textColor: ColorUtils.White,
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: CustomButton(
                              onPress: () async {
                                dynamic data = {
                                  "inviteId": item.id,
                                  "status": false
                                };
                                Utils.loadingProgress(context);
                                final response = await Provider.of<OrganizationProvider>(context, listen: false).toggleJoinRequest(data);
                                if(response == true){
                                  Navigator.pop(context);
                                  Toasts.showToast(ColorUtils.Green, "Request declined successfully");
                                }
                              },
                              buttonText: "Decline",
                              buttonColor: ColorUtils.Red,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              textColor: ColorUtils.White,
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );;
              },
            )
          ],
        ),
      ),
    );
  }
}
