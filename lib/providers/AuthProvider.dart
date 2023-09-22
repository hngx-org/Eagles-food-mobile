import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/network/network.dart';

class AuthProvider with ChangeNotifier{
  User? _user;
  bool? _isLoggedIn;
  bool _isLoading = false;

  User? get user => _user;
  bool? get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<dynamic> getUserProfile() async {
    const String url = 'user/profile';
    try{
      _isLoading = true;
      final response = await Network.get(url);
      var user = response["data"];
      print(user);
      _user = User.fromJson(user);
      _isLoggedIn = false;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }


  Future<dynamic> login(Map<String, dynamic> userData) async {
    const String url = 'auth/login';
    final Map<String, dynamic> data = {
      'email': userData['email'],
      'password': userData['password'].trim(),
    };
    try {
      final response = await Network.post(endpoint: url, data: jsonEncode(data));

      if(response['success']){
        SessionManager ss = SessionManager();
        ss.setToken(response['data']['access_token']);
        ss.setLogin(true);
        notifyListeners();
        return true;
      }else{
        return false;
      }

    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> register(Map<String, dynamic> userData) async {
    const String url = 'auth/user/signup';
    final Map<String, dynamic> data = {
      'firstName': userData['firstName'],
      'lastName': userData['lastName'],
      'email': userData['email'],
      'phone': userData['phone'],
      'password': userData['password'],
    };
    try {
      final response = await Network.post(endpoint: url, data: json.encode(data));
      if(response['success']){
        SessionManager ss = SessionManager();
        ss.setLogin(true);
        notifyListeners();
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> logout() async {
    SessionManager ss = SessionManager();
    ss.logout();
    ss.setLogin(false);
    ss.removeUser();
    notifyListeners();
  }



}