import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';

Widget lessonScreenAppBar(String courseName,String courseId,BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    color: kLightColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),
              if(LayoutCubit.get(context).indexVideoLesson==-1)
              SizedBox(
                width: 80.w,
              ),
              if(LayoutCubit.get(context).indexVideoLesson!=-1)
              SizedBox(
                width: 30.w,
              ),
              if(LayoutCubit.get(context).indexVideoLesson==-1)
              SizedBox(
                width: 180.w,
                child: Text(
                  "All Lessons",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.spMin,
                      color: Colors.black),
                ),
              ),
              if(LayoutCubit.get(context).indexVideoLesson!=-1)
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
            ],
          ),
        ],
      ),
    ],
  );
}
