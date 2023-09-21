import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {

  Future<void> saveUser(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  Future<Map<String, dynamic>> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var user =  prefs.getString("user") ?? '';
    return jsonDecode(user);
  }

  Future<void> saveProfileSetup(value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("profile_setup", value);
  }

  Future<bool> getProfileSetup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("profile_setup") ?? false ;
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

  Future<String> getFcmTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("fcm_token") ?? '';
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
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
    prefs.remove("token");
    prefs.setBool("isLoggedIn", false);
  }

}