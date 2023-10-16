import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorUtils.Green,
  hintColor: ColorUtils.Yellow,
  unselectedWidgetColor: ColorUtils.LightGrey,
  // ignore: deprecated_member_use
  backgroundColor: ColorUtils.Black,
  fontFamily: 'Stapel',
  splashFactory: NoSplash.splashFactory,
  buttonTheme: ButtonThemeData(
    buttonColor: ColorUtils.Green,
    textTheme: ButtonTextTheme.primary,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    padding: EdgeInsets.zero,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  iconTheme: IconThemeData(color: ColorUtils.White),
  textTheme: TextTheme(
    // main primary body text
    bodyLarge: TextStyle(
      color: ColorUtils.White,
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),

    // secondary body text
    bodyMedium: TextStyle(
        color: ColorUtils.White,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 15),

    // secondary body text
    bodySmall: TextStyle(
        color: ColorUtils.White,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 13),

    // main heading text
    displayLarge: TextStyle(
      color: ColorUtils.White,
      fontFamily: 'Stapel',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w900,
      fontSize: 25,
    ),

    // for all other headers
    displayMedium: TextStyle(
        color: ColorUtils.White,
        fontFamily: 'Stapel',
        fontStyle: FontStyle.normal,
        fontSize: 25,
        fontWeight: FontWeight.w600),

    //
    displaySmall: TextStyle(
        color: ColorUtils.White,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 22,
        fontWeight: FontWeight.w600),

    // used for buttons
    headlineMedium: TextStyle(
      color: ColorUtils.White,
      fontFamily: 'Stapel',
      fontStyle: FontStyle.normal,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),

    // label + caption
    headlineSmall: TextStyle(
        color: ColorUtils.White,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontSize: 14,
        fontWeight: FontWeight.w500),
  ),
);
