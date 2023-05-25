import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:online_course/features/presentation/views/teacher/teacherLessonsScreen/components/teacherLessoneCard.dart';

Widget teacherLessonsListview({required List<LessonModel> lessonModel,required int indexs}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 15.h,
      ),
      Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Text(
            "All Lessons",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22.spMin,
                color: Colors.black),
          ),
        ],
      ),
      Container(
        margin: EdgeInsetsDirectional.only(start: 22.w, end: 22.w, top: 10.h),
        height: 573.h,
        width: 330.w,
        child: ListView.separated(
          padding: EdgeInsetsDirectional.zero,
          physics: BouncingScrollPhysics(),
          itemCount: lessonModel.length,
          itemBuilder: (context, index) => teacherLessoneCard(
            lessonModel: lessonModel[index],
            index: indexs,
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
        ),
      ),
    ],
  );
}
