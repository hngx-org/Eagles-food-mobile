
import 'package:flutter/material.dart';
import 'package:hng_task3/configs/colors.dart';

ThemeData theme = ThemeData(
    primaryColor: ColorUtils.Green,
    hintColor: ColorUtils.Yellow,
    backgroundColor: ColorUtils.Green.withOpacity(0.09),
    unselectedWidgetColor: ColorUtils.Grey,
    fontFamily: 'Inter',
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
        bodyText1:  TextStyle(
            color: ColorUtils.Black,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontSize: 14,
            fontWeight: FontWeight.w400,
        ),

        // secondary body text
        bodyText2: TextStyle(
            color: ColorUtils.Grey,
            fontFamily: 'Inter',
            height: 1.5,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: 12
        ),

        // main heading text
        headline1: TextStyle(
            color: ColorUtils.Black,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            fontSize: 25,
        ),

        // for all other headers
        headline2: TextStyle(
            color: ColorUtils.Black,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontSize: 23,
            fontWeight: FontWeight.w700
        ),

        //
        headline3: TextStyle(
            color: ColorUtils.Black,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontSize: 20,
            fontWeight: FontWeight.w500
        ),

        // used for buttons
        headline4: TextStyle(
            color: ColorUtils.Grey,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4
        ),

        // label + caption
        headline5: TextStyle(
            color: ColorUtils.Grey,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),

        //overline + button small
        headline6: TextStyle(
            color: ColorUtils.Grey,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1
        ),
    ),
);
