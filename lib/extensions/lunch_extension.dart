import 'package:hng_task3/configs/sessions.dart';
import 'package:hng_task3/models/lunch.dart';
import 'package:hng_task3/models/user.dart';

extension LunchExtension on Lunch {

  Future<bool> isReceived() async {
    var userMap = await SessionManager().getUser();
    User user = User.fromJson(userMap);
    return (user.id == receiverId.toString());
  }
}
