import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Utils {
  static loadingProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: ColorUtils.Grey.withOpacity(0.4),
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: ColorUtils.Green,
              size: 50,
            ),
          );
        });
  }

  static loading() {
    return Center(
      child: SizedBox(
        width: 25,
        height: 25,
        child: CupertinoActivityIndicator(
          color: ColorUtils.Blue,
          radius: 15,
        ),
      ),
    );
  }

  static String getTimeOfDay() {
    final currentTime = DateTime.now().hour;

    if (currentTime < 12) {
      return 'Morning';
    } else if (currentTime < 17) {
      return 'Afternoon';
    } else {
      return 'Evening';
    }
  }
}
