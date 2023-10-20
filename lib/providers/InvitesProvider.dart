import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/models/invite.dart';
import 'package:hng_task3/models/sentInvite.dart';
import 'package:hng_task3/network/network.dart';

class InvitesProvider with ChangeNotifier {
  List<Invite> _invites = [];
  List<SendInvite> _allPendingInvites = [];
  List<SendInvite> _allAcceptedInvites = [];
  List<SendInvite> _allDeclinedInvites = [];
  bool _isLoading = false;

  List<Invite> get invites => _invites;
  List<SendInvite> get allPendingInvites => _allPendingInvites;
  List<SendInvite> get allAcceptedInvites => _allAcceptedInvites;
  List<SendInvite> get allDeclinedInvites => _allDeclinedInvites;
  bool get isLoading => _isLoading;

  Future<dynamic> getInvites() async {
    const String url = 'users/user-invites';
    try {
      _isLoading = true;
      _invites = [];
      final response = await Network.get(url);
      if(response['success'] == true){
        var invites = response['data'];
        invites.forEach((invite) {
          _invites.add(Invite.fromJson(invite));
        });
        _isLoading = false;
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }

  }

  Future<dynamic> getAllInvites() async {
    const String url = 'users/user-invites';
    try {
      _isLoading = true;
      _invites = [];
      final response = await Network.get(url);
      if(response['success'] == true){
        var invites = response['data'];
        invites.forEach((invite) {
          _invites.add(Invite.fromJson(invite));
        });
        _isLoading = false;
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> sendInvite(Map<String, dynamic> data) async {
    const String url = 'organizations/invite';
    try {
      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      print(response);
      if(response['success'] == true){
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

//  accept invite
  Future<dynamic> replyInvite(Map<String, dynamic> data) async {
    const String url = 'users/toggle-invite';
    try {
      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      if(response['success'] == true){
        List<Invite> _updatedList = [];
        _invites.forEach((element) {
          if(element.id != data['inviteId']){
            _updatedList.add(element);
          }
        });
        _invites = _updatedList;
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

//  invites history
  Future<dynamic> getInvitesHistory() async {
    const String url = 'organizations/organization-invites';
    try {
      _isLoading = true;
      _allPendingInvites = [];
      _allAcceptedInvites = [];
      _allDeclinedInvites = [];
      final response = await Network.get(url);
      if(response['success'] == true){
        var invites = response['data'];
        print(invites);
        invites.forEach((invite) {
          if(invite['status'] == false){
            _allDeclinedInvites.add(SendInvite.fromJson(invite));
          }else if (invite['status'] == true){
            _allAcceptedInvites.add(SendInvite.fromJson(invite));
          }else{
            _allPendingInvites.add(SendInvite.fromJson(invite));
          }
        });
        _isLoading = false;
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }

  }

//  cancel invite
  Future<dynamic> cancelOrgInvite(dynamic data) async {
    const String url = 'organizations/invite/cancel';
    try {
      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      if(response['success'] == true){
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }
}