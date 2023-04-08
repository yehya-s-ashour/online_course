import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SearchTextField.dart';

Widget homeAppBar() {
  return Container(
    padding: EdgeInsetsDirectional.only(top: 50.h, start: 20.w, end: 20.w),
    height: 235.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      ),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.1, 0.5],
        colors: [
          Color(0xFF463bce),
          Color(0xff5d54dd),
        ],
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey User,",
                  style: TextStyle(
                      fontSize: 27.spMin,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  " Let's Start Learning",
                  style: TextStyle(fontSize: 22.spMin, color: Colors.white),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 35.spMax,
                ),
                onPressed: () {}),
          ],
        ),
        SizedBox(
          height: 54.h,
        ),
        SearchTextField(),
      ],
    ),
  );
}
