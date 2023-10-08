import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/models/invite.dart';
import 'package:hng_task3/network/network.dart';

class InvitesProvider with ChangeNotifier {
  List<Invite> _invites = [];
  List<Invite> _allPendingInvites = [];
  List<Invite> _allAcceptedInvites = [];
  List<Invite> _allDeclinedInvites = [];
  bool _isLoading = false;


  List<Invite> get invites => _invites;
  List<Invite> get allPendingInvites => _allPendingInvites;
  List<Invite> get allAcceptedInvites => _allAcceptedInvites;
  List<Invite> get allDeclinedInvites => _allDeclinedInvites;
  bool get isLoading => _isLoading;

  Future<dynamic> getInvites() async {
    const String url = 'user/userinvites';
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
    const String url = 'user/userinvites';
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
    const String url = 'organization/invite';
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

//  accept invite
  Future<dynamic> replyInvite(Map<String, dynamic> data) async {
    const String url = 'user/toggleinvite';
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

//  invites history
  Future<dynamic> getInvitesHistory() async {
    const String url = 'organization/organizationinvites';
    try {
      _isLoading = true;
      _allPendingInvites = [];
      _allAcceptedInvites = [];
      _allDeclinedInvites = [];
      final response = await Network.get(url);
      if(response['success'] == true){
        var invites = response['data'];
        invites.forEach((invite) {
          if(invite['status'] == true){
            _allDeclinedInvites.add(Invite.fromJson(invite));
          }else if (invite['status'] == true){
            _allPendingInvites.add(Invite.fromJson(invite));
          }else{
            _allPendingInvites.add(Invite.fromJson(invite));
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
}