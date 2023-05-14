import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/data/models/courseEnroll_model.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/starsRating.dart';
import 'package:online_course/features/presentation/views/lesson/lessonScreen.dart';

class myCoursesCourseCard extends StatelessWidget {
  final CourseEnrollModel course;
  const myCoursesCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LayoutCubit.get(context).changeIndexVideoLesson(-1);
        Get.to(LessonScreen(
          courseId: course.courseId,
          mainCategory: course.mainCategory,
          name: course.name,
          previewVideo: course.previewVideo,
          subCategory: course.subCategory,
        ));
      },
      child: Container(
        height: 5.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 4.0.r,
              spreadRadius: .05.r,
            ),
          ],
        ),
        child: Column(
          children: [
            CustomImage(
              course.image,
              isNetwork: true,
              width: 200.w,
              height: 100.h,
              radius: 12.r,
            ),

            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 7.w,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    course.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15.5.spMin,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  "${course.lessonsSeen.length} Lessons",
                  style: TextStyle(
                      fontSize: 11.spMin,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 153, 151, 151)),
                ),
                Spacer(),
                Text(
                  "${course.numberOfLessons} Lessons",
                  style: TextStyle(
                      fontSize: 11.spMin,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 153, 151, 151)),
                ),                SizedBox(width: 9.w,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
