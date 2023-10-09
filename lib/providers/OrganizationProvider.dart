import 'dart:convert';

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
    const String url = 'organization/all';
    try{
      _organizations = [];
      _isLoading = true;
      final response = await Network.get(url);
      var data = response["data"];
      print(data);
      data.forEach((element) {
        _organizations.add(Organization.fromJson(element));
      });
      print(_organizations);
      _isLoading = false;
      notifyListeners();
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future<dynamic> getUserJoinRequest() async {
    const String url = 'organization/organizationinviterequest';
    try{
      _org_request = [];
      _isLoading = true;
      final response = await Network.get(url);
      var data = response["data"];
      data.forEach((element) {
        _org_request.add(OrgRequest.fromJson(element));
      });
      _isLoading = false;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }


  Future<dynamic> requestToJoinOrg(int orgId) async {
    final String url = 'user/requesttojoinOrg/$orgId';
    try{
      _isLoading = true;
      final response = await Network.post(endpoint: url);
      if(response['success'] == true) {
        _isLoading = false;
        notifyListeners();
        return true;
      }
    }catch(e){
      print(e);
    }
  }

  Future<dynamic> toggleJoinRequest(Map<String, dynamic> data) async {
    const String url = 'organization/toggleinvite';
    try{
      _isLoading = true;

      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      print(response);
      if(response['success'] == true) {
        // _org_request.forEach((element) {
        //     if(element.id == data['inviteId']){
        //       _org_request.remove(element);
        //       notifyListeners();
        //     }
        // });
        _isLoading = false;
        notifyListeners();
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e);
    }
  }



}