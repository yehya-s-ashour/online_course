import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/allCoursesRecomenedCoursesScreen.dart';
import 'package:online_course/features/presentation/views/cours_berfore_enrolling/courseBrforeEnrolling.dart';
import 'package:online_course/features/presentation/views/lesson/lessonScreen.dart';

import 'CourseCard.dart';
import 'onGoingCourse/components/onGoingCourseCard.dart';

class recommendedCourses extends StatelessWidget {
  const recommendedCourses({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.h),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Row(
            children: [
              Text(
                "Recomended Courses",
                style: TextStyle(
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(AllCoursesRecomenedCoursesScreen());
                },
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 17.spMin,
                    color: Color(0xFF463bce),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 186.h,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 1.h,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.83.h,
              crossAxisSpacing: 13.w,
              mainAxisSpacing: 15.h,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(courseBrforeEnrollingScreen());
                },
                child: courseCard(
                  category: categoryList[index],
                ),
              );
            },
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }
}
