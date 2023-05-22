import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/lesson/lessonScreen.dart';

Widget courseDescriptionCard(Course courseModel, BuildContext context) {
  return Directionality(
    textDirection:
        userEntity.language == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      padding: EdgeInsetsDirectional.only(start: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Text(
            userEntity.language == 'Arabic' ? "الوصف" : "Description",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 24.spMin,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  courseModel.description,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18.spMin,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.65)),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 7.w,
              ),
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
                    LayoutCubit.get(context).changeIndexVideoLesson(-1);
                    Get.to(LessonScreen(
                      courseId: courseModel.courseId,
                      mainCategory: courseModel.mainCategory,
                      name: courseModel.name,
                      previewVideo: courseModel.previewVideo,
                      subCategory: courseModel.subCategory,
                    ));
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
                    Text(
                      userEntity.language == 'Arabic'
                          ? "27 اختبار قصير"
                          : "27 Quiz",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.spMin,
                          color: Colors.black.withOpacity(0.6)),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
