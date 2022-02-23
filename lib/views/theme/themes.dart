import 'package:flutter/material.dart';
import 'package:recipe_flutter/shared/colors.dart';
import 'package:recipe_flutter/shared/dimens.dart';

import 'colors.dart';

final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: primaryColorLight),
    primaryColorLight: primaryColorLight,
    canvasColor: surfaceColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColorLight,
        selectedItemColor: secondaryColorLight,
        unselectedItemColor: Colors.grey[500]),
    primaryColor: primaryColorLight,
    fontFamily: 'Raleway',
    textTheme: getTextTheme(),
    accentTextTheme: getAccentTheme());

final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: primaryColorDark),
    primaryColorLight: primaryColorDark,
    canvasColor: primaryVariantColorDark,
    cardTheme: CardTheme(
      color: primaryColorDark
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColorDark,
        selectedItemColor: secondaryColorDark,
        unselectedItemColor: Colors.grey[500]),
    primaryColor: primaryColorDark,
    fontFamily: 'Raleway',
    textTheme: getTextTheme(isLightMode: false),
    accentTextTheme: getAccentTheme(isLightMode: false));

TextTheme getAccentTheme({bool isLightMode = true}){
  return  TextTheme(
    bodyText1: TextStyle(
        color: Colors.grey[700], fontSize: 12, fontFamily: 'RobotoMono'),
    bodyText2: TextStyle(
        color:  Colors.black54,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono'),
    subtitle1: TextStyle(
        color: Colors.grey[700], fontSize: 15, fontFamily: 'RobotoMono'),
    subtitle2:
    TextStyle(color: Colors.grey, fontFamily: 'RobotoMono', fontSize: 10),
  );
}

TextTheme getTextTheme({bool isLightMode = true}) {
  return TextTheme(
    headline1: TextStyle(
        color: isLightMode ? Colors.black54 : Colors.grey,
        fontSize: 18, fontFamily: 'RobotMono', fontWeight: FontWeight.w500),
    headline2: TextStyle(
        color: titleColor,
        fontFamily: 'RobotMono-Bold',
        fontWeight: FontWeight.bold,
        fontSize: TITLE_TEXT_SIZE),
    headline3: TextStyle(
        fontSize: 17,
        color: isLightMode ? titleColor : secondaryColorDark,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono'),
    bodyText1: TextStyle(
        fontSize: 18, fontFamily: "RobotoMono", fontWeight: FontWeight.w500),
    bodyText2: TextStyle(
        color: isLightMode ? Colors.black54 : Colors.grey,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono'),
    subtitle1: TextStyle(
        fontSize: 24, fontFamily: "RobotoMono", fontWeight: FontWeight.w500),
  );
}
