import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/leaderboard.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/models/team.dart';
import 'package:hng_task3/network/network.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class TeamAndLunchProvider with ChangeNotifier {
  List<Team> _my_team = [];
  List<Team> _everyone = [];
  List<Lunch> _lunchHistory = [];
  bool _isLoading = false;
  List<LeaderBoard> _leaderboard = [];

  List<Lunch> get lunchHistory => _lunchHistory;
  List<Team> get my_team => _my_team;
  List<Team> get everyone => _everyone;
  bool get isLoading => _isLoading;
  List<LeaderBoard> get leaderboard => _leaderboard;

  Future<dynamic> getUsers() async {
    const String url = 'user/all';
    try{
      _my_team = [];
      _everyone = [];
      _isLoading = true;
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
      _isLoading = false;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

//  send lunch
  Future<dynamic> sendLunch(Map<String, dynamic> lunchData, int balanceAmt) async {
    const String url = 'lunch/send';
    final Map<String, dynamic> data = {
      'receivers': lunchData['receivers'],
      'note': lunchData['note'],
      'quantity': lunchData['quantity']
    };
    try {
      _isLoading = true;
      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      if(response['success'] == true){
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

//  lunch history
  Future<dynamic> getLunchHistory() async {
    const String url = 'lunch/all';
    try{
      _lunchHistory = [];
      final response = await Network.get(url);
      var lunchHistory = response["data"];
      lunchHistory.forEach((element) {
        _lunchHistory.add(Lunch.fromJson(element));
      });
      notifyListeners();
    }catch(e){
      print(e);
    }
  }

//  withdraw lunch
  Future<dynamic> withDrawLunch(int amount, int balanceAmt) async {
    const String url = 'lunch/withdrawlunch';
    final data = {
      "quantity" : amount
    };
    try {
      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      if(response['success'] == true){
        SessionManager ss = SessionManager();
        var user = await ss.getUser();
        user['LunchCreditBalance'] = balanceAmt.toString();
        ss.saveUser(user);
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getLeaderBoard() async {
    const String url = '';
    try{
     _leaderboard = [];
      final response = await Network.get(url);
      var data = response["data"];
      data.forEach((element) {
        _leaderboard.add(LeaderBoard.fromJson(data));
      });
      _isLoading = false;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }


}