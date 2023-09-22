
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

class Utils {
  static loadingProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: ColorUtils.Grey.withOpacity(0.4),
        builder: (context) {
          return Center(
            child: CupertinoActivityIndicator(
              color: ColorUtils.Green,
              radius: 15,
            ),
          );
        });
  }
}