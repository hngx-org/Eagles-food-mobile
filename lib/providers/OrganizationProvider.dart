import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/org_request.dart';
import 'package:hng_task3/models/organization.dart';
import 'package:hng_task3/network/network.dart';

class OrganizationProvider with ChangeNotifier {
  List<Organization> _organizations = [];
  bool _isLoading = false;
  List<OrgRequest> _org_request = [];
  bool _isFetchingOrgs = false;
  bool _isFetchingUserJoinReq = false;

  List<Organization> get organizations => _organizations;
  bool get isLoading => _isLoading;
  List<OrgRequest> get org_request => _org_request;
  bool get isFetchingOrgs => _isFetchingOrgs;
  bool get isFetchingUserJoinReq => _isFetchingUserJoinReq;

  // Organization (all became plural)
  // /api/v{version}/organizations/organization-invites
  // /api/v{version}/organizations/organization-invite-request
  // /api/v{version}/organizations/toggle-invite


  Future<dynamic> getOrganizations(
      {required int page, required String process}) async {
    SessionManager ss = SessionManager();
    var initialFetchOrg = await ss.getInitialFetchOrg();
    print('initial fetch org $initialFetchOrg');
    page ??= 1;
    final String url = 'organizations/all?pageNumber=$page';
    try {
      if (page == 1 || initialFetchOrg) {
        _organizations = [];
        _isLoading = true;
      }
      if (_organizations.isNotEmpty) {
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
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getUserJoinRequest(page) async {
    page ??= 1;
    final String url =
        'organizations/organization-invite-request?pageNumber=$page';
    try {
      if (page == 1) {
        _org_request = [];
        _isLoading = true;
      }
      if (_org_request.isNotEmpty) {
        _isFetchingUserJoinReq = true;
      }
      final response = await Network.get(url);
      var data = response["data"];
      print("org request $data");
      data.forEach((element) {
        _org_request.add(OrgRequest.fromJson(element));
      });
      _isFetchingUserJoinReq = false;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(e);
    }
  }

  Future<dynamic> requestToJoinOrg(int orgId) async {
    final String url = 'users/join-request/$orgId';
    try {
      _isLoading = true;
      final response = await Network.post(endpoint: url);
      if (response['success'] == true) {
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(e);
    }
  }

  Future<dynamic> toggleJoinRequest(Map<String, dynamic> data) async {
    const String url = 'organizations/toggle-invite';
    print(data);
    try {
      _isLoading = true;
      final response =
          await Network.post(endpoint: url, data: jsonEncode(data));
      print(response);
      if (response['success'] == true) {
        List<OrgRequest> updatedList = [];
        for (var element in _org_request) {
          if (element.id != data['inviteId']) {
            updatedList.add(element);
          }
        }
        _org_request = updatedList;
        notifyListeners();
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(e);
    }
  }

  Future<dynamic> leaveOrg() async {
    const String url = 'organizations/leave';
    try{
      final response = await Network.get(url);
      if(response['statusCode'] == 200 ){
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
