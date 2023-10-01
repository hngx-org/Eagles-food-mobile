import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: ColorUtils.Green,
  hintColor: ColorUtils.Yellow,
  unselectedWidgetColor: ColorUtils.LightGrey,
  backgroundColor: ColorUtils.Black,
  fontFamily: 'Stapel',
  splashFactory: NoSplash.splashFactory,
  colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: ColorUtils.White,
      primary: ColorUtils.Green,
      onPrimary: ColorUtils.White,
      secondary: ColorUtils.Black,
      onSecondary: ColorUtils.White,
      error: Colors.red,
      onError: Colors.white,
      onBackground: ColorUtils.Black,
      surface: Colors.white,
      onSurface: ColorUtils.Black
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: ColorUtils.Blue,
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
        color: ColorUtils.Grey,
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