import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/data/models/courses_model.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';

Widget courseBrforeEnrollingScreenAppBar(String courseName,BuildContext context,Course coursesModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        children: [
          SizedBox(
            height: 35.h,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 15.w,
              end: 15.w,
              bottom: 15.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                  width: 190.w,
                  child: Text(
                    courseName,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.spMin,
                        color: Colors.black),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // LayoutCubit.get(context).setContactChat(coursesModel: coursesModel);
                  },
                  child: Icon(
                    Icons.favorite_sharp,
                    color: Colors.red,
                    size: 30.spMin,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
