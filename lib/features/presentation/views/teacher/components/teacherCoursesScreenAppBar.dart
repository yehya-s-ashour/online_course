import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/presentation/views/teacher/createCourse/createCourseScreen.dart';

Widget teacherCoursesScreenAppBar() {
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
              SizedBox(
                width: 120.w,
              ),
              Text(
                "My Courses",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.spMin,
                    color: Colors.black),
              ),
              SizedBox(
                width: 50.w,
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
                      Get.to(createCourseScreen());
                    }),
              )
            ],
          ),
        ],
      ),
    ],
  );
}
