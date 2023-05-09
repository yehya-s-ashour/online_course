import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget courseBrforeEnrollingScreenAppBar(String courseName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              SizedBox(
                width: 260.w,
                child: Text(
                  courseName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.spMin,
                      color: Colors.black),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.favorite_sharp,
                  color: Colors.red,
                  size: 30.spMin,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
