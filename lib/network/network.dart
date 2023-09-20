import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hng_task3/network/errors.dart';
import 'package:hng_task3/network/network_utils.dart';
import 'package:hng_task3/utils/toast.dart';
import 'package:http/http.dart' as http;

//this base url should be the url of the backend e.g www.backend.com/api
const String baseUrl = "";

class Network {

  static Future<dynamic> get(String endpoint) async {

    if(await NetworkUtils.hasNetwork()){
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var response = await http.get(url, headers: await NetworkUtils.headers());
        if(response.statusCode == 200){
          return  json.decode(response.body);
        } else{
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
      }
    } else{
      Toasts.showToast(Colors.black, "No Internet Connection");
    }
  }

  static Future<dynamic> post({required String endpoint, dynamic data}) async {
    if(await NetworkUtils.hasNetwork()){
      var url = Uri.parse(baseUrl + endpoint);

      try {
        var response = await http.post(url, headers: await NetworkUtils.headers(), body: data);
        if(response.statusCode == 200){
          return json.decode(response.body);
        } else{
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
      }
    }else{
      Toasts.showToast(Colors.black, "No Internet Connection");
    }

  }

}