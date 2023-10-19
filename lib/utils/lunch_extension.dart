import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/models/user.dart';

extension LunchExtension on Lunch {

  Future<String> isReceived() async {
    if(senderId == 0 ){
      return 'sent';
    }else if(lunchStatus == 1){
      return 'received';
    }else{
      return 'withdrawn';
    }
  }

}
