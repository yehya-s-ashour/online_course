import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';

Widget lessonScreenAppBar(
    String courseName, String courseId, BuildContext context) {
  return Directionality(
    textDirection:
        userEntity.language == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(3.r),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
                if (LayoutCubit.get(context).indexVideoLesson == -1)
                  SizedBox(
                    width: 85.w,
                  ),
                if (LayoutCubit.get(context).indexVideoLesson != -1)
                  SizedBox(
                    width: 45.w,
                  ),
                if (LayoutCubit.get(context).indexVideoLesson == -1)
                  SizedBox(
                    width: 180.w,
                    child: Text(
                      userEntity.language == 'Arabic'
                          ? "كل الدروس"
                          : "All Lessons",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.spMin,
                          color: Colors.black),
                    ),
                  ),
                if (LayoutCubit.get(context).indexVideoLesson != -1)
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      courseName,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.spMin,
                          color: Colors.black),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ],
    ),
  );
}
