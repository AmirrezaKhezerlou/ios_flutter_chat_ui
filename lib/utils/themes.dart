import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatThemeClass {
  static final lightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: CupertinoColors.white,
    primaryColor: CupertinoColors.black,
    barBackgroundColor: CupertinoColors.white,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.black,
      textStyle: TextStyle(fontFamily: 'Roboto'),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      pickerTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 20,
      ),
      dateTimePickerTextStyle: TextStyle(
        color: CupertinoColors.black,
        fontSize: 20,
      ),
    ),
  );

  static final darkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray,
    primaryColor: CupertinoColors.white,
    barBackgroundColor: CupertinoColors.darkBackgroundGray,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      textStyle: TextStyle(fontFamily: 'Roboto'),
      navTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      navLargeTitleTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      pickerTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20,
      ),
      dateTimePickerTextStyle: TextStyle(
        color: CupertinoColors.white,
        fontSize: 20,
      ),
    ),
  );

  // Helper method to get appropriate Cupertino colors based on brightness
  static Color getListTileColor(BuildContext context) {
    return CupertinoTheme.of(context).brightness == Brightness.light
        ? CupertinoColors.white
        : CupertinoColors.darkBackgroundGray;
  }

  // Helper method to get divider color
  static Color getDividerColor(BuildContext context) {
    return CupertinoTheme.of(context).brightness == Brightness.light
        ? CupertinoColors.lightBackgroundGray
        : CupertinoColors.separator.darkColor;
  }

  // Helper method to get card color
  static Color getCardColor(BuildContext context) {
    return CupertinoTheme.of(context).brightness == Brightness.light
        ? CupertinoColors.white
        : CupertinoColors.systemGrey6.darkColor;
  }

  // Helper method to get icon color
  static Color getIconColor(BuildContext context) {
    return CupertinoTheme.of(context).brightness == Brightness.light
        ? CupertinoColors.black
        : CupertinoColors.white;
  }
}