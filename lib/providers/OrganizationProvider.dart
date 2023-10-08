import 'package:flutter/cupertino.dart';
import 'package:hng_task3/models/org_request.dart';
import 'package:hng_task3/models/organization.dart';
import 'package:hng_task3/network/network.dart';

class OrganizationProvider with ChangeNotifier{

  List<Organization> _organizations = [];
  bool _isLoading = false;
  List<OrgRequest> _org_request = [];

  List<Organization> get organizations  => _organizations;
  bool get isLoading => _isLoading;
  List<OrgRequest> get org_request => _org_request;


  Future<dynamic> getOrganizations() async {
    const String url = '';
    try{
      _organizations = [];
      _isLoading = true;
      final response = await Network.get(url);
      var data = response["data"];
      data.forEach((element) {
        _organizations.add(Organization.fromJson(data));
      });
      _isLoading = false;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future<dynamic> getUserJoinRequest() async {
    const String url = '';
    try{
      _org_request = [];
      _isLoading = true;
      final response = await Network.get(url);
      var data = response["data"];
      data.forEach((element) {
        _org_request.add(OrgRequest.fromJson(data));
      });
      _isLoading = false;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }


}