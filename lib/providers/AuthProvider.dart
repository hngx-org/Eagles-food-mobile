import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/organization.dart';
import 'package:hng_task3/models/user.dart';
import 'package:hng_task3/network/network.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool? _isLoggedIn;
  bool _isLoading = false;
  String? _userOrg;
  Organization? _organization;


  User? get user => _user;
  bool? get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get userOrg => _userOrg;

  void updateUserLunch(String balance) {
    print("updating user lunch balance , ${_user?.lunchCreditBalance}");
    _user?.lunchCreditBalance = balance;
    print("updated user lunch balance , ${_user?.lunchCreditBalance}");
  }

  void updateUserOrg(org, orgId) {
    print('updating user org');
    _user?.orgName = org;
    _user?.orgId = orgId.toString();
    print('updated user org, ${_user?.orgName}');
  }

  Future<dynamic> getUserProfile() async {
    const String url = 'users/profile';
    try {
      final response = await Network.get(url);
      var user = response["data"];
      _user = User.fromJson(user);
      notifyListeners();
    } catch (e) {
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
      final response =
          await Network.post(endpoint: url, data: jsonEncode(data));
      if (response['success'] == true) {
        var user = response['data'];
        print(user);
        var token = response['data']['access_token'];
        _user = User.fromJson(user);
        _isLoggedIn = true;
        notifyListeners();
        notifyListeners();
        SessionManager ss = SessionManager();
        ss.setToken(token);
        ss.setLogin(true);
        ss.saveUser(_user!.toJson());
        return true;
      } else {
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
      'address': userData['address'],
      'phone': userData['phone'],
      'password': userData['password'],
      'inviteCode':  userData['inviteCode']
    };
    try {
      final response =
          await Network.post(endpoint: url, data: json.encode(data));
      if (response['success'] == true) {
        var user = response['data'];
        _user = User.fromJson(user);
        _isLoggedIn = true;
        notifyListeners();
        notifyListeners();
        SessionManager ss = SessionManager();
        ss.setLogin(true);
        ss.setToken(response['data']['access_token']);
        ss.saveUser(_user!.toJson());
        return true;
      }
      return false;
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> orgRegister(Map<String, dynamic> userData) async {
    const String url = 'organizations/staff/signup';
    final Map<String, dynamic> data = {
      'firstName': userData['firstName'],
      'lastName': userData['lastName'],
      'email': userData['email'],
      'orgCurrencyCode': userData['orgCurrencyCode'],
      'phone': userData['phone'],
      'password': userData['password'],
      'orgName': userData['orgName'],
      'orgLunchPrice': userData['orgLunchPrice'],
      'orgHidden': false,
    };
    try {
      final response =
          await Network.post(endpoint: url, data: json.encode(data));
      if (response['success'] == true) {
        var user = response['data'];
        _user = User.fromJson(user);
        _isLoggedIn = true;
        notifyListeners();
        notifyListeners();
        SessionManager ss = SessionManager();
        ss.setLogin(true);
        ss.setToken(response['data']['access_token']);
        ss.saveUser(_user!.toJson());
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> updateProfile(Map<String, dynamic> data) async {
    const String url = 'users/update';
    try {
      final response = await Network.multipart(endpoint: url, data: data);
      if (response['statusCode'] == 200) {
        var user = response['data'];
        _user = User.fromJson(user);
        notifyListeners();
        notifyListeners();
        SessionManager ss = SessionManager();
        ss.saveUser(_user!.toJson());
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> verifyOTP(String email, String otp) async {
    String url = 'auth/verify-reset-token?email=$email&token=$otp';
    try {
      _isLoading = true;
      final response = await Network.get(url);
      if (response['success'] == true) {
        _isLoading = false;
        return true;
      } else {
        _isLoading = false;
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> forgotPassword(Map<String, dynamic> userData) async {
    const String url = 'auth/forgot-password';
    final Map<String, dynamic> data = {
      'email': userData['email'],
    };
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(data));
      if (response['statusCode'] == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> resetPassword(Map<String, dynamic> userData) async {
    const String url = 'auth/reset-password';
    final Map<String, dynamic> data = {
      'email': userData['email'],
      'resetToken': userData['resetToken'],
      'newPassword': userData['newPassword'],
    };
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(data));
      if (response['statusCode'] == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> changePassword(Map<String, dynamic> userData) async {
    const String url = 'auth/change-password';
    final Map<String, dynamic> data = {
      'email': userData['email'],
      'oldPassword': userData['oldPassword'],
      'newPassword': userData['newPassword'],
    };
    try {
      final response =
          await Network.post(endpoint: url, data: jsonEncode(data));
      if (response['statusCode'] == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> getUserOrg() async {
    const String url = 'users/organization';
    try {
      final response = await Network.get(url);
      var org = response["data"];
      _userOrg = org['Organization'];
      _user?.orgName = org['Organization'];
      _user?.orgId = org['Organization_Id'].toString();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getUserLunchBalance() async {
    const String url = 'lunch/lunch-balance';
    try {
      final response = await Network.get(url);
      var lunchBalance = response["data"];
      _user?.lunchCreditBalance = lunchBalance['balance'].toString();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> logout() async {
    SessionManager ss = SessionManager();
    ss.logout();
    ss.setLogin(false);
    ss.removeUser();
    notifyListeners();
  }

  Future<dynamic> organisationSignUp(Map<String, dynamic> userData) async {
    const String url = 'organizations/staff/signup';
    final Map<String, dynamic> data = {
      'firstName': userData['firstName'],
      'lastName': userData['lastName'],
      'email': userData['emailAdress'],
      'address': userData['address'],
      'phone': userData['phone'],
      'password': userData['password'],
      'orgName': userData['orgName'],
      'orgLunchPrice': userData['orgLunchPrice'],
    };
    try {
      final response =
          await Network.post(endpoint: url, data: json.encode(data));
      if (response['success'] == true) {
        var user = response['data'];
        _user = User.fromJson(user);
        _isLoggedIn = true;
        notifyListeners();
        notifyListeners();
        SessionManager ss = SessionManager();
        ss.setLogin(true);
        ss.setToken(response['data']['access_token']);
        ss.saveUser(_user!.toJson());
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> userfetchOrganization() async {
    const String url = 'users/organization';
    try {
      final response = await Network.get(url);
      if (response['statusCode'] == 200) {
        _organization = Organization.fromJson(jsonDecode(response.body));
        debugPrint(_organization!.name);
        debugPrint(_organization!.currencyCode);
        debugPrint(_organization!.lunchPrice.toString()); //
        notifyListeners();
        SessionManager ss = SessionManager();
        ss.saveUser(_user!.toJson());
      }
    } catch (error) {
      print(error);
    }
  }

}
