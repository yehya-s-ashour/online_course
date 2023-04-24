import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../features/data/models/contact_chat_model.dart';
import 'package:http/http.dart' as http;

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

Widget getReaction(String sh) {
  if (sh == '1') {
    return Text(
      '👍',
      style: TextStyle(
        fontSize: 14.spMin,
      ),
    );
  } else if (sh == '2') {
    return Text(
      '❤',
      style: TextStyle(
        fontSize: 14.spMin,
      ),
    );
  } else if (sh == '3') {
    return Text(
      '😂',
      style: TextStyle(
        fontSize: 14.spMin,
      ),
    );
  } else if (sh == '4') {
    return Text(
      '😭',
      style: TextStyle(
        fontSize: 14.spMin,
      ),
    );
  } else if (sh == '5') {
    return Text(
      '😡',
      style: TextStyle(
        fontSize: 14.spMin,
      ),
    );
  } else if (sh == '6') {
    return Text(
      '🤯',
      style: TextStyle(
        fontSize: 14.spMin,
      ),
    );
  } else {
    return Text(
      '😈',
      style: TextStyle(
        fontSize: 14.spMin,
      ),
    );
  }
}

Codec<String, String> stringToBase64Url = utf8.fuse(base64);
String? uid;
String? profilePicMe;


String updateNam = '';
String updateSta = '';


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




