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

  List<Team>? get searchedUsers => _searchedUsers;

  SessionManager ss = SessionManager();

  Future<dynamic> getMyTeam(int page, String process) async {
    print('current page $page');
    var initialFetchTeam = await ss.getInitialFetchTeam();
    page ??= 1;
    final String url = 'user/all?pageNumber=$page';
    if (initialFetchTeam || process == 'refresh') {
      try {
        _my_team = [];
        _isLoadingTeam = true;
        final response = await Network.get(url);
        if (response['success'] == true) {
          var user = response["data"];
          print(user);
          user.forEach((element) {
            _my_team.add(Team.fromJson(element));
          });
          ss.setInitialFetchTeam(false);
          _isLoadingTeam = false;
          notifyListeners();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<dynamic> getAllOthers(page) async {
    print('current page $page');
    page ??= 1;
    print('current page $page');
    final String url = 'user/others?pageNumber=$page';
    print(url);
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
  Future<dynamic> getLunchHistory(page, process) async {
    SessionManager ss = SessionManager();
    var initialFetchLunch = await ss.getInitialFetchLunchHistory();
    page ??= 1;
    final String url = 'lunch/all?pageNumber=$page';
    try {
      if (page == 1 || process == 'refresh' || initialFetchLunch) {
        _lunchHistory = [];
      }
      if (_lunchHistory.isNotEmpty) {
        _isFetchingLunchHistory = true;
        notifyListeners();
      }
      final response = await Network.get(url);
      var lunchHistory = response["data"];
      lunchHistory.forEach((element) {
        _lunchHistory.add(Lunch.fromJson(element));
      });
      ss.setInitialFetchLunchHistory(false);
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
    print('current page $page');
    page ??= 1;
    final String url = 'lunch/leaderboard?pageNumber=$page';
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

/*   Future<dynamic> searchUsersByName(String name) async {
    final String url = 'user/searchname?name=$name';
    try {
      _everyone = [];
      _my_team = [];
      _isLoading = true;
      final response = await Network.get(url);
      if (response['statusCode'] == 200) {
        var data = response["data"];
        data.foreach((element) {
          _everyone.add(Team.fromJson(element));
          _my_team.add(Team.fromJson(element));
        });
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  } */

  Future<dynamic> searchUsersByName(String name) async {
    final String url = 'user/searchname/$name';
    try {
      _searchedUsers = [];
      _isLoading = true;
      final response = await Network.get(url);
      if (response['statusCode'] == 200) {
        List<dynamic> data = response["data"];
        print('searched users from backend: $data');
        final result = data.map((element) => Team.fromJson(element)).toList();
        _searchedUsers = result;
        print('result: $result');
        print('searched users: $_searchedUsers');
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
    final String url = 'user/search/$email';
    try {
      _searchedUsers = [];
      _isLoading = true;
      final response = await Network.get(url);
      if (response['statusCode'] == 200) {
        var data = response["data"];
        print('searched user from backend: $data');
        final result = Team.fromJson(data);

        _searchedUsers = [result];
        print('result: $result');
        print('searched user: $_searchedUsers');
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
