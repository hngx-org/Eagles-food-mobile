import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  Future<void> saveUser(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  Future<Map<String, dynamic>> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString("user") ?? '';
    return jsonDecode(user);
  }

  Future<void> saveProfileSetup(value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("profile_setup", value);
  }

  Future<bool> getProfileSetup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("profile_setup") ?? false;
  }

  Future<void> setLogin(value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLoggedIn", value);
  }

  Future<bool> getLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isLoggedIn") ?? false;
  }

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? '';
  }

  Future<void> saveFcmTokens(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fcm_token", token);
  }

  Future<void> setInitialFetchTeam(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("initialFetchTeam", val);
  }
  Future<bool> getInitialFetchTeam() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("initialFetchTeam") ?? true;
  }

  Future<void> setInitialFetchOthers(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("initialFetchOthers", val);
  }
  Future<bool> getInitialFetchOthers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("initialFetchOthers") ?? true;
  }

  Future<void> setInitialFetchLunchHistory(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("initialFetchLunchHistory", val);
  }
  Future<bool> getInitialFetchLunchHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("initialFetchLunchHistory") ?? true;
  }

  Future<void> setInitialFetchLeaderboard(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("initialFetchLeaderboard", val);
  }
  Future<bool> getInitialFetchLeaderboard() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("initialFetchLeaderboard") ?? true;
  }

  Future<void> setInitialFetchOrg(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("initialFetchOrg", val);
  }
  Future<bool> getInitialFetchOrg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("initialFetchOrg") ?? true;
  }

  Future<void> setFirstTime(bool val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstTime", val);
  }

  Future<bool> isFirstTime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("isFirstTime") ?? true;
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", false);
    prefs.setString('token', '');
    prefs.setString('user', '');
    prefs.remove("fcm_token");
    prefs.remove("initialFetchTeam");
    prefs.remove("initialFetchOthers");
    prefs.remove("initialFetchLunchHistory");
    prefs.remove("initialFetchLeaderboard");
    prefs.remove("initialFetchOrg");
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
    prefs.remove("token");
    prefs.setBool("isLoggedIn", false);

  }
}
