import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';

const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

InputDecoration otpInputDecoration(
        {double circle = 15, bool? filled, Color? fillColor}) =>
    InputDecoration(
      filled: filled,
      fillColor: fillColor ?? kLightBgColor.withOpacity(.8),
      contentPadding: EdgeInsets.symmetric(vertical: 15.h),
      border: outlineInputBorder(circle: circle),
      focusedBorder: outlineInputBorder(circle: circle),
      enabledBorder: outlineInputBorder(circle: circle),
    );

OutlineInputBorder outlineInputBorder({required double circle}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(circle.r),
    borderSide: const BorderSide(color: kLightColor),
  );
}
