// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/leaderboard.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/models/team.dart';
import 'package:hng_task3/network/network.dart';

import '../configs/colors.dart';
import '../utils/toast.dart';

class TeamAndLunchProvider with ChangeNotifier {
  List<Team> _my_team = [];
  List<Team> _everyone = [];
  List<Lunch> _lunchHistory = [];
  bool _isLoading = false;
  bool _isLoadingTeam = false;
  bool _isLoadingOthers = false;
  bool _isFetchingOthers = false;
  List<LeaderBoard> _leaderboard = [];
  String _lunchCreditBalance = '';
  bool _isFetchingLeaderboard = false;
  bool _isFetchingLunchHistory = false;
  bool _isFetchingTeam = false;
  bool _isLoadingHistory = false;

  List<Team>? _searchedUsers;

  List<Lunch> get lunchHistory => _lunchHistory;
  List<Team> get my_team => _my_team;
  List<Team> get everyone => _everyone;
  bool get isLoading => _isLoading;
  bool get isLoadingTeam => _isLoadingTeam;
  bool get isLoadingOthers => _isLoadingOthers;
  bool get isFetchingOthers => _isFetchingOthers;
  List<LeaderBoard> get leaderboard => _leaderboard;
  String get lunchCreditBalance => _lunchCreditBalance;
  bool get isFetchingLeaderboard => _isFetchingLeaderboard;
  bool get isFetchingLunchHistory => _isFetchingLunchHistory;
  bool get isFetchingTeam => _isFetchingTeam;
  bool get isLoadingHistory => _isLoadingHistory;

  List<Team>? get searchedUsers => _searchedUsers;

  SessionManager ss = SessionManager();

  Future<dynamic> getMyTeam(int page, String process) async {
    var initialFetchTeam = await ss.getInitialFetchTeam();
    page ??= 1;
    final String url = 'users/all?pageNumber=$page';
    if (initialFetchTeam || process == 'refresh' || process == 'loading') {
      try {
        if(process != 'loading'){
          _my_team = [];
          _isLoadingTeam = true;
        }
        if(_my_team.isNotEmpty){
          _isFetchingTeam = true;
        }
        final response = await Network.get(url);
        if (response['success'] == true) {
          var user = response["data"];
          user.forEach((element) {
            _my_team.add(Team.fromJson(element));
          });
          ss.setInitialFetchTeam(false);
          _isLoadingTeam = false;
          _isFetchingTeam = false;
          notifyListeners();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<dynamic> getAllOthers(page) async {
    page ??= 1;
    final String url = 'users/others?pageNumber=$page';
    try {
      var initialFetchOthers = await ss.getInitialFetchOthers();
      if (page == 1 || initialFetchOthers) {
        _everyone = [];
      }
      if (_everyone.isNotEmpty) {
        _isFetchingOthers = true;
      }
      final response = await Network.get(url);
      if (response['success'] == true) {
        var others = response["data"];
        others.forEach((element) {
          _everyone.add(Team.fromJson(element));
        });
        ss.setInitialFetchOthers(false);
        _isLoadingOthers = false;
        _isFetchingOthers = false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

//  send lunch
  Future<dynamic> sendLunch(Map<String, dynamic> lunchData) async {
    const String url = 'lunches/send';
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
  Future<dynamic> getLunchHistory(page, process) async {
    SessionManager ss = SessionManager();
    var initialFetchLunch = await ss.getInitialFetchLunchHistory();
    page ??= 1;
    final String url = 'lunches/all?pageNumber=$page';
    try {

      if (process == 'refresh' || initialFetchLunch) {
        _lunchHistory = [];
        _isLoadingHistory = true;
      }

      if (_lunchHistory.isNotEmpty || process == 'loading') {
        _isFetchingLunchHistory = true;
        notifyListeners();
      }
      final response = await Network.get(url);
      var lunchHistory = response["data"];
      print(lunchHistory);
      lunchHistory.forEach((element) {
        _lunchHistory.add(Lunch.fromJson(element));
      });
      _isLoadingHistory = false;
      _isFetchingLunchHistory = false;
      ss.setInitialFetchLunchHistory(false);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

//  withdraw lunch
  Future<dynamic> withDrawLunch(int amount, int balanceAmt) async {
    const String url = 'lunches/withdraw-lunch';
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
    print('current page $page');
    page ??= 1;
    final String url = 'lunches/leaderboard?pageNumber=$page';
    try {
      var initialFetchLearderboard = await ss.getInitialFetchLeaderboard();
      if (page == 1 || initialFetchLearderboard) {
        _leaderboard = [];
        _isLoading = true;
      }

      if (_leaderboard.isNotEmpty) {
        _isFetchingLeaderboard = true;
      }
      final response = await Network.get(url);
      var data = response["data"];
      print(data);
      data.forEach((element) {
        _leaderboard.add(LeaderBoard.fromJson(element));
      });
      ss.setInitialFetchLeaderboard(false);
      _isFetchingLeaderboard = false;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getLunchCreditBalance() async {
    const String url = 'lunches/lunch-balance';
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

  Future<dynamic> searchUsersByName(String name) async {
    final String url = 'users/searchname/$name';
    try {
      _searchedUsers = [];
      _isLoading = true;
      final response = await Network.get(url);
      if (response['statusCode'] == 200) {
        List<dynamic> data = response["data"];
        final result = data.map((element) => Team.fromJson(element)).toList();
        _searchedUsers = result;
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> searchUsersByEmail(String email) async {
    final String url = 'users/search/$email';
    try {
      _searchedUsers = [];
      _isLoading = true;
      final response = await Network.get(url);
      if (response['statusCode'] == 200) {
        var data = response["data"];
        final result = Team.fromJson(data);
        _searchedUsers = [result];
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}
