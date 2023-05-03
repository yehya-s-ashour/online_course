import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/components/allCoursesRecomenedCoursesScreenCourseCard.dart';
import 'package:online_course/features/presentation/views/lesson/lessonScreen.dart';

Widget allCoursesRecomenedCoursesScreenListView() {
  return Container(
    height: 620.h,
    child: GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 1.h,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.935.h,
        crossAxisSpacing: 13.w,
        mainAxisSpacing: 15.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Get.to(LessonScreen());
          },
          child: AllCoursesRecomenedCoursesScreenCourseCard(
            category: categoryList[index],
          ),
        );
      },
      itemCount: categoryList.length,
    ),
  );
}
