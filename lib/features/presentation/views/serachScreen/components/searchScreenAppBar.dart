import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';

Widget searchScreenAppBar() {
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
                    Get.to(MainHomeScreen());
                  }),
              SizedBox(
                width: 108.w,
              ),
              Text(
                "Search",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.spMin,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    ],
  );
}
