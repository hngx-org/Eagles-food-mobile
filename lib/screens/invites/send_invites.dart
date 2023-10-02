import 'package:flutter/material.dart';
import 'package:hng_task3/components/shimmers/teamShimmer.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/models/team.dart';
import 'package:hng_task3/providers/TeamAndLunchProvider.dart';
import 'package:hng_task3/utils/utils.dart';
import 'package:provider/provider.dart';
class SendInvites extends StatefulWidget {
  const SendInvites({super.key});

  @override
  State<SendInvites> createState() => _SendInvitesState();
}

class _SendInvitesState extends State<SendInvites> {

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<TeamAndLunchProvider>(context, listen: false).getUsers();
    super.initState();
  }

  void search(String query) {
    query = query.toLowerCase();
    filtered = list.where((person) {
      return person.name.toLowerCase().contains(query);
    }).toList();
  }

  List<Team> filtered = [];
  List<Team> list = [];

  @override
  Widget build(BuildContext context) {
    list = Provider.of<TeamAndLunchProvider>(context).everyone;
    return Scaffold(
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
                "Send Team Invite",
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
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
                    search(value);
                },
              ),
            ),
            Text("Send an invite for someone to join your team",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: ColorUtils.LightGrey
            ),),

            list.isEmpty ? ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 0),
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) => const TeamShimmer()
            ) : ListView.builder(
              itemCount: filtered.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemBuilder: (context, index) {
                final item = filtered[index];
                return SizedBox(
                    width: double.infinity,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(item.image.toString()),
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
                        padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 0),
                        color: ColorUtils.Green,
                        child: TextButton(
                          onPressed: () {

                          },
                          child: Text(
                            'Invite',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 13, color: Colors.white),
                          ),
                        ),
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
