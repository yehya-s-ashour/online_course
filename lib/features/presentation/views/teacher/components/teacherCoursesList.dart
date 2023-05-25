import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/views/teacher/components/teacherCoursesCard.dart';
import 'package:online_course/features/presentation/views/teacher/teacherLessonsScreen/teacherLessonsScreen.dart';

Widget teacherCoursesList() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsetsDirectional.only(start: 22.w, end: 22.w, top: 10.h),
        height: 550.h,
        width: 330.w,
        child: ListView.separated(
          padding: EdgeInsetsDirectional.zero,
          physics: BouncingScrollPhysics(),
          itemCount: teacherCourseslist.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(teacherLessonsScreen(index: index,));
            },
            child: teacherCoursesCard(
              course: teacherCourseslist[index],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
        ),
      ),
    ],
  );
}
