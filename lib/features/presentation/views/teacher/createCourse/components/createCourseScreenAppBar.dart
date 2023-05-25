import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget createCourseScreenAppBar() {
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
                width: 75.w,
              ),
              SizedBox(
                width: 150.w,
                child: Text(
                  "Create Course",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22.spMin,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
