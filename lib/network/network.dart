import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/network/errors.dart';
import 'package:hng_task3/network/network_utils.dart';
import 'package:hng_task3/utils/toast.dart';
import 'package:http/http.dart' as http;

//this base url should be the url of the backend e.g www.backend.com/api
const String baseUrl = "https://hngxeaglesfood-4graz0d2.b4a.run/api/v1/";

class Network {
  static Future<dynamic> get(String endpoint) async {
    if (await NetworkUtils.hasNetwork()) {
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var response =
            await http.get(url, headers: await NetworkUtils.headers());
        if (response.statusCode == 200) {
          return json.decode(response.body);
        } else {
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
      }
    } else {
      Toasts.showToast(Colors.black, "No Internet Connection");
    }
  }

  static Future<dynamic> post({required String endpoint, dynamic data}) async {
    if (await NetworkUtils.hasNetwork()) {
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var response = await http.post(url,
            headers: await NetworkUtils.headers(), body: data);
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return json.decode(response.body);
        } else {
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
      }
    } else {
      Toasts.showToast(Colors.black, "No Internet Connection");
    }
  }

  static Future<dynamic> put({required String endpoint, dynamic data}) async {
    if (await NetworkUtils.hasNetwork()) {
      var url = Uri.parse(baseUrl + endpoint);
      try {
        print('request started');
        var response = await http.put(url,
            headers: await NetworkUtils.headers(), body: data);
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return json.decode(response.body);
        } else {
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
      }
    } else {
      Toasts.showToast(Colors.black, "No Internet Connection");
    }
  }

  static Future<dynamic> multipart(
      {required String endpoint, dynamic data}) async {
    if (await NetworkUtils.hasNetwork()) {
      var token = await SessionManager().getToken();
      final Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'Accept': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(baseUrl + endpoint);
      try {
        var request = http.MultipartRequest('PUT', url);
        request.headers.addAll(await NetworkUtils.headers());
        request.fields['firstName'] = data['firstName'];
        request.fields['lastName'] = data['lastName'];
        request.fields['email'] = data['email'];
        request.fields['phone'] = data['phone'];
        request.fields['photo'] = data['photo'];

        var result = await request.send();
        var response = await http.Response.fromStream(result);
        if (response.statusCode == 200) {
          return json.decode(response.body);
        } else {
          print("multipart error ${response.statusCode}");
          NetworkErrors.handleNetworkErrors(response);
        }
      } catch (e, stackTrace) {
        print(stackTrace);
        Toasts.showToast(Colors.red, 'Request failed');
      }
    } else {
      Toasts.showToast(Colors.black, "No Internet Connection");
    }
  }
}
