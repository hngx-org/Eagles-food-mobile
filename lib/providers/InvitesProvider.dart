import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hng_task3/network/network.dart';

class InvitesProvider with ChangeNotifier {

  Future<dynamic> sendInvite() async {
    const String url = 'lunch/send';
    final Map<String, dynamic> data = {

    };
    try {
      final response = await Network.post(endpoint: url, data: jsonEncode(data));
      if(response['success'] == true){
        notifyListeners();
        return true;
      }else{
        return false;
      }

    } catch (error) {
      print(error);
    }

  }
}