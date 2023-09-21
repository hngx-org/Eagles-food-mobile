import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

ThemeData theme = ThemeData(
    primaryColor: ColorUtils.Green,
    hintColor: ColorUtils.Yellow,
    unselectedWidgetColor: ColorUtils.Grey,
    fontFamily: 'Stapel',
    splashFactory: NoSplash.splashFactory,

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
        iconTheme: IconThemeData(
            color: Colors.black
        ),
    ),

    textTheme: TextTheme(
        // main primary body text
        bodyLarge:  TextStyle(
            color: ColorUtils.Black,
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
            fontSize: 13
        ),

        // main heading text
        displayLarge: TextStyle(
            color: ColorUtils.Black,
            fontFamily: 'Stapel',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
            fontSize: 30,
        ),

        // for all other headers
        displayMedium: TextStyle(
            color: ColorUtils.Black,
            fontFamily: 'Stapel',
            fontStyle: FontStyle.normal,
            fontSize: 25,
            fontWeight: FontWeight.w600
        ),

        //
        displaySmall: TextStyle(
            color: ColorUtils.Black,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontSize: 23,
            fontWeight: FontWeight.w600
        ),

        // used for buttons
        headlineMedium: TextStyle(
            color: ColorUtils.Black,
            fontFamily: 'Stapel',
            fontStyle: FontStyle.normal,
            fontSize: 16,
            fontWeight: FontWeight.w500,
        ),

        // label + caption
        headlineSmall: TextStyle(
            color: ColorUtils.Grey,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),

        //overline + button small
        titleLarge: TextStyle(
            color: ColorUtils.Grey,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1
        ),
    ),
);
