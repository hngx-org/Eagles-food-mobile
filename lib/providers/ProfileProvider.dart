
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../network/network.dart';

class ProfileProvider with ChangeNotifier {

  Future<dynamic> updateProfile(Map<String, dynamic> data) async {
    const String url = 'user/update';
    print(data);
    try {
      final response = await Network.multipart(endpoint: url, data: data);
      if(response['statusCode'] == 200){
        print(response);
        return true;
      }else{
        return false;
      }
    } catch (error) {
      print(error);
    }
  }

}