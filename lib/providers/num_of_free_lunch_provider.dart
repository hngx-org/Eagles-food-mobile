import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumOfFreeLunchProvider with ChangeNotifier {
 String numOfFreeLunch = '';

  SharedPreferences? _preferences;
   NumOfFreeLunchProvider() {
     initPreferences();
   }
  Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    numOfFreeLunch = _preferences!.getString('numOfFreeLunch')?? '';

  }

  Future<void> updateNumOfFreeLunches({
    required String numOfFreeLunch,

  }) async {
    this.numOfFreeLunch = numOfFreeLunch;


    await _preferences?.setString('numOfFreeLunch', numOfFreeLunch);

    notifyListeners();
  }
}