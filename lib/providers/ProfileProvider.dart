
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../network/network.dart';

class ProfileProvider with ChangeNotifier {

  Future<dynamic> updateProfile(Map<String, dynamic> userData) async {
    const String url = 'user/update';
    final Map<String, dynamic> data = {
      'firstName': userData['firstName'],
      'lastName': userData['lastName'],
      'email': userData['email'],
      'phone': userData['phone'],
      'profilePic': userData['profilePic'],

    };
    try {
      final response = await Network.put(endpoint: url, data: json.encode(data));
      if(response['statusCode'] == 200){

        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

}