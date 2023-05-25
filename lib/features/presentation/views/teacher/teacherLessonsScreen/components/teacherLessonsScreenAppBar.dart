import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';
import 'package:online_course/features/presentation/views/teacher/createLesson/createLessonScreen.dart';

Widget teacherLessonsScreenAppBar({required String name,required int index,}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30.spMax,
                  ),
                  onPressed: () {
                    Get.back();
                  }),
              SizedBox(
                width: 30.w,
              ),
              Container(
                width: 200.w,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22.spMin,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2.spMin,
                      offset: Offset(5, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 35.spMax,
                    ),
                    onPressed: () {
                      Get.to(createLessonScreen(
                        index: index,
                      ));
                    }),
              )
            ],
          ),
        ],
      ),
    ],
  );
}
