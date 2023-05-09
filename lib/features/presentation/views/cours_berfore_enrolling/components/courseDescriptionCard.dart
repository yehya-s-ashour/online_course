import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/views/lesson/lessonScreen.dart';

Widget courseDescriptionCard(Course courseModel,BuildContext context) {
  return Container(
    padding: EdgeInsetsDirectional.only(start: 20.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "Description",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        SizedBox(height: 5.h,),
        Row(
          children: [
            // SizedBox(
            //   width: 10.w,
            // ),
            Expanded(
              child: Text(
                courseModel.description,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.spMin,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6)),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        if(userEntity.courseEnroll.contains(courseModel.courseId))
        Row(
          children: [
            SizedBox(width: 7.w,),
            Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                color: mixedColor,
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 7.0,
                    spreadRadius: 1.5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 36.0,
                ),
                onPressed: () {

                  Get.to(LessonScreen(courseModel: courseModel,));
                },
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${courseModel.numberOfLessons} Lessons",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20.spMin,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Row(
                    children: [Text(
                      "27 Quiz",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.spMin,
                          color: Colors.black.withOpacity(0.6)),
                    ),],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
