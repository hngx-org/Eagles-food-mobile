import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:hng_task3/utils/toast.dart';
import 'package:http/http.dart' as http;

class NetworkErrors {
  static void handleNetworkErrors(http.Response response) {
    final result = json.decode(response.body);
    if (response.statusCode == 404) {
      Toasts.showToast(ColorUtils.Red, result['message'] ?? 'Account not found, please create an account');
    } else if (response.statusCode == 400) {
      Toasts.showToast(ColorUtils.Red, result['message'] ?? 'Please provide all fields');
    } else if (response.statusCode == 401) {
      Toasts.showToast(ColorUtils.Red, result['message'] ?? 'Unauthenticated');
    } else if(response.statusCode == 310){
      Toasts.showToast(ColorUtils.Yellow, result['message'] ?? 'Email not verified');
    } else if (response.statusCode == 500) {
      Toasts.showToast(ColorUtils.Red, result['message'] ?? 'Something went wrong');
    } else {
      Toasts.showToast(ColorUtils.Red, 'Something happened, try again');
    }
  }

}