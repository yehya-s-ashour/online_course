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
      status: '',
      profilePic: '',
      phoneNumber: '+972598376479',
      isOnline: true,
      groupId: const [],
      whoCanSee: {},
      lastSeen: getGlobalTimeLocal(),
      archivedChats: true,
      isEnter: true,
      mediaVisibility: true,
      conversationTones: true,
      highMessage: true,
      highGroup: true,
      reactionMessage: true,
      reactionGroup: true,
      isAbout: 'All',
      isGroup: 'All',
      isLastSeen: 'All',
      isOnlineSeen: 'All',
      isProfileSee: 'All',
      isTimerMessage: 'Off',
      isStatus: 'My Contacts',
      vibrateMessage: 'Default',
      vibrateGroup: 'Default',
      vibrateCall: 'Default',
      lightMessage: 'White',
      lightGroup: 'White',
      language: 'English',
      theme: 'Light',
      fontType: 'Small',
      wallpaper: '',
      token: '',
      muteNotification: [],
      userBlock: [],
    );
    List<int> sub=[0,0];




