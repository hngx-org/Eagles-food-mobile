// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/leaderboard.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/models/team.dart';
import 'package:hng_task3/network/network.dart';
import 'package:hng_task3/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

import '../configs/colors.dart';
import '../utils/toast.dart';

class TeamAndLunchProvider with ChangeNotifier {
  List<Team> _my_team = [];
  List<Team> _everyone = [];
  List<Lunch> _lunchHistory = [];
  bool _isLoading = false;
  List<LeaderBoard> _leaderboard = [];
  String _lunchCreditBalance = '';

  List<Lunch> get lunchHistory => _lunchHistory;
  List<Team> get my_team => _my_team;
  List<Team> get everyone => _everyone;
  bool get isLoading => _isLoading;
  List<LeaderBoard> get leaderboard => _leaderboard;
  String get lunchCreditBalance => _lunchCreditBalance;

  Future<dynamic> getMyTeam(page) async {
    print('current page $page');
    page ??= 1;
    final String url = 'user/all?pageNumber=$page';
    try {
      if(page ==1 ){
        _my_team = [];
        _isLoading = true;
      }
      final response = await Network.get(url);
     if(response['success'] == true){
       var user = response["data"];
       print(user);
       user.forEach((element) {
         _my_team.add(Team.fromJson(element));
       });
       _isLoading = false;
       notifyListeners();
     }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getAllOthers(page) async {
    print('current page $page');
    page ??= 1;
    print('current page $page');
    final String url = 'user/others?pageNumber=$page';
    print(url);
    try {
      if(page ==1 ){
        _everyone = [];
        _isLoading = true;
      }
      final response = await Network.get(url);
     if(response['success'] == true){
       var others = response["data"];
       others.forEach((element) {
         _everyone.add(Team.fromJson(element));
       });
       _isLoading = false;
       notifyListeners();
     }
    } catch (e) {
      print(e);
    }
  }

//  send lunch
  Future<dynamic> sendLunch(Map<String, dynamic> lunchData) async {
    const String url = 'lunch/send';
    final Map<String, dynamic> data = {
      'receivers': lunchData['receivers'],
      'note': lunchData['note'],
      'quantity': lunchData['quantity']
    };
    try {
      _isLoading = true;
      final response =
          await Network.post(endpoint: url, data: jsonEncode(data));
      if (response['success'] == true) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      Toasts.showToast(ColorUtils.Green, error.toString());
    }
  }

//  lunch history
  Future<dynamic> getLunchHistory(page) async {
    page ??= 1;
    final String url = 'lunch/all?pageNumber=$page';
    try {
      if(page == 1){
        _lunchHistory = [];
      }
      final response = await Network.get(url);
      var lunchHistory = response["data"];
      lunchHistory.forEach((element) {
        _lunchHistory.add(Lunch.fromJson(element));
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

//  withdraw lunch
  Future<dynamic> withDrawLunch(int amount, int balanceAmt) async {
    const String url = 'lunch/withdrawlunch';
    final data = {"quantity": amount};
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(data));
      if (response['success'] == true) {
        SessionManager ss = SessionManager();
        var user = await ss.getUser();
        user['LunchCreditBalance'] = balanceAmt.toString();
        ss.saveUser(user);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getLeaderBoard(page) async {
    page ??= 1;
    final String url = 'lunch/leaderboard?pageNumber=$page';
    try {
      if(page ==1 ){
        _leaderboard = [];
        _isLoading = true;
      }
      final response = await Network.get(url);
      var data = response["data"];
      print(data);
      data.forEach((element) {
        _leaderboard.add(LeaderBoard.fromJson(element));
      });
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getLunchCreditBalance() async {
    const String url = 'lunch/lunch-balance';
    try {
      final response = await Network.get(url);
      var data = response["data"]["balance"];
      _lunchCreditBalance = data.toString();
      print('lunch credit balance: $_lunchCreditBalance');

      notifyListeners();
      return _lunchCreditBalance;
    } catch (e) {
      print(e);
    }
  }
}
