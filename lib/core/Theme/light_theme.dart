import 'package:flutter/material.dart';
import 'package:online_course/core/Theme/styles/colors.dart';

//main color
final Color _lightPrimaryColor = kPrimaryColor.withOpacity(0.1);

//Background Colors
Color _lightBackgroundAppBarColor = _lightPrimaryColor;

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: kLightBgColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: _lightPrimaryColor,
  ),
  appBarTheme: const AppBarTheme(color: kAppBarColorLight),
  cardTheme: CardTheme(color: kLightCardBgColor, elevation: 0),
  colorScheme: ColorScheme.light(
    primary: _lightPrimaryColor,
    secondary: _lightPrimaryColor,
  ),
  switchTheme: SwitchThemeData(
    overlayColor: MaterialStateProperty.all(kPrimaryColor),
  ),
  snackBarTheme: const SnackBarThemeData(
      backgroundColor: kDarkColor, actionTextColor: kPrimaryLightTextColor),
  iconTheme: const IconThemeData(
    color: kDarkColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: mixedColor,
    foregroundColor: kLightColor,
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  )),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(color: _lightBackgroundAppBarColor),
  buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textTheme: ButtonTextTheme.primary),
  unselectedWidgetColor: _lightPrimaryColor,
  timePickerTheme: TimePickerThemeData(
    backgroundColor: kPrimaryColor,
  ),
);
