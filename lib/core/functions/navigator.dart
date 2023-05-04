import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:online_course/core/functions/time.dart';
import 'package:online_course/features/domain/entities/user.dart';

void navigatePop(
  BuildContext context,
) {
  Navigator.of(context).pop();
}

void navigateAndRemove(
  BuildContext context,
  String routeName, {
  dynamic? arguments,
}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    routeName,
    arguments: arguments,
    (route) => false,
  );
}

Future<Object?> navigateTo(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  return Navigator.of(context).pushNamed(
    routeName,
    arguments: arguments,
  );
}

void navigateAndReplace(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(context).pushReplacementNamed(
    routeName,
    arguments: arguments,
  );
}

Codec<String, String> stringToBase64Url = utf8.fuse(base64);
String? uid;
String? profilePicMe;

String updateNam = '';
String updateSta = '';
bool ismessageController = false;
int intmessageController = 0;

final List<Transition> transition = [
  Transition.zoom,
  Transition.fade,
  Transition.size,
  Transition.circularReveal,
  Transition.cupertino,
  Transition.fadeIn,
  Transition.leftToRight,
  Transition.downToUp,
  Transition.topLevel,
];

List<String> newSeenMessage = [];

List<String> seenMessageNumber = [];
UserEntity userEntity = UserEntity(
  name: 'Ahmed',
  uId: '',
  bio: '',
  profilePic: '',
  language: 'English',
  theme: 'Light',
  wallpaper: '',
  token: '',
  email: '',
  password: '',
);
List<int> sub = [0, 0];
