import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';

Widget myCoursesAppBar() {
  return Directionality(
    textDirection:
        userEntity.language == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Text(
                userEntity.language == 'Arabic' ? "كورساتي" : "My Courses",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.spMin,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ],
    ),
  );
}
