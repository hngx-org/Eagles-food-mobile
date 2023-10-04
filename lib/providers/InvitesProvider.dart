import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/models/invite.dart';
import 'package:hng_task3/network/network.dart';

class InvitesProvider with ChangeNotifier {
  List<Invite> _invites = [];
  List<Invite> _allinvites = [];
  bool _isLoading = false;


  List<Invite> get invites => _invites;
  List<Invite> get allinvites => _invites;
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
}