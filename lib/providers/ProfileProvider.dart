
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../network/network.dart';

class ProfileProvider with ChangeNotifier {

  Future<dynamic> updateProfile(Map<String, dynamic> data) async {
    const String url = 'user/update';
    try {
      final response = await Network.put(endpoint: url, data: jsonEncode(data));
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