import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/org_request.dart';
import 'package:hng_task3/models/organization.dart';
import 'package:hng_task3/network/network.dart';

class OrganizationProvider with ChangeNotifier{

  List<Organization> _organizations = [];
  bool _isLoading = false;
  List<OrgRequest> _org_request = [];
  bool _isFetchingOrgs = false;
  bool _isFetchingUserJoinReq = false;


  List<Organization> get organizations  => _organizations;
  bool get isLoading => _isLoading;
  List<OrgRequest> get org_request => _org_request;
  bool get isFetchingOrgs => _isFetchingOrgs;
  bool get isFetchingUserJoinReq => _isFetchingUserJoinReq;

  Future<dynamic> getOrganizations(page) async {
    page??= 1;
    final String url = 'organization/all?pageNumber=$page';
    try{
      if(page ==1 ) {
        _organizations = [];
        _isLoading = true;
      }
      if(_organizations.isNotEmpty){
        _isFetchingOrgs = true;
      }
      final response = await Network.get(url);
      var data = response["data"];
      data.forEach((element) {
        _organizations.add(Organization.fromJson(element));
      });
      SessionManager().setInitialFetchOrg(false);
      _isFetchingOrgs = false;
      _isLoading = false;
      notifyListeners();
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

  Future<dynamic> getUserJoinRequest(page) async {
    page??=1;
    final String url = 'organization/organizationinviterequest?pageNumber=$page';
    try{
      if(page ==1 ) {
        _org_request = [];
        _isLoading = true;
      }
      if(_org_request.isNotEmpty){
        _isFetchingUserJoinReq = true;
      }
      final response = await Network.get(url);
      var data = response["data"];
      data.forEach((element) {
        _org_request.add(OrgRequest.fromJson(element));
      });
      _isFetchingUserJoinReq = false;
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
    print(data);
    try{
      _isLoading = true;
      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      print(response);
      if(response['success'] == true) {
        List<OrgRequest> _updatedList = [];
        _org_request.forEach((element) {
            if(element.id != data['inviteId']){
              _updatedList.add(element);
            }
        });
        _org_request = _updatedList;
        notifyListeners();
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