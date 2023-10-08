// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, 
    required this.onPress,
    this.buttonText,
    this.buttonColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = 'Stapel',
    this.isUppercase = false,
    this.textColor = Colors.white,
    this.isOutlined = false,
    this.outlineColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 25),
    this.centerText = true,
    this.icon,
    this.iconHeight = 20,
    this.iconWidth = 20
});

  final fontSize;
  final fontWeight;
  final fontFamily;
  final buttonText;
  final buttonColor;
  final textColor;
  final isOutlined;
  final outlineColor;
  final VoidCallback? onPress;
  final padding;
  final centerText;
  final icon;
  final iconHeight;
  final iconWidth;
  final isUppercase;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        enableFeedback: false,
        splashFactory: NoSplash.splashFactory,
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        onSurface: Colors.transparent,
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Container(
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: !isOutlined ? buttonColor : ColorUtils.White,
          border: isOutlined ? Border.all(color: outlineColor) : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null) Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.asset(icon, height: iconHeight.toDouble(), width: iconWidth.toDouble()),
            ),
            Text(isUppercase ? buttonText.toUpperCase() : buttonText,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: textColor,
                    fontSize: fontSize.toDouble(),
                    fontWeight: FontWeight.w500,
                    fontFamily: fontFamily
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
