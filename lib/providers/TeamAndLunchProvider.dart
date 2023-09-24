import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/team.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/network/network.dart';

class TeamAndLunchProvider with ChangeNotifier{
  List<Team> _my_team = [];
  List<Team> _everyone = [];

  List<Team> get my_team => _my_team;
  List<Team> get everyone => _everyone;

  Future<dynamic> getUsers() async {
    const String url = 'user/all';
    try{
      _my_team = [];
      _everyone = [];
      final response = await Network.get(url);
      var user = response["data"];
      var my_team = user['org'];
      var everyone = user['others'];
      my_team.forEach((element) {
        _my_team.add(Team.fromJson(element));
      });
      everyone.forEach((element) {
        _everyone.add(Team.fromJson(element));
      });
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

//  send lunch
  Future<dynamic> sendLunch(Map<String, dynamic> lunchData) async {
    const String url = 'user/lunch';
    final Map<String, dynamic> data = {
      'receivers': lunchData['receivers'],
      'note': lunchData['note'],
      'quantity': lunchData['quantity']
    };

    print(data);
    try {
      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      print("response from send lunch $response");
      // if(response['success'] == true){
      //
      //   notifyListeners();
      //   return true;
      // }else{
      //   return false;
      // }

    } catch (error) {
      print(error);
    }
  }


}