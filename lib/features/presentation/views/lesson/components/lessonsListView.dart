import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/lesson.dart';

import 'lessonCard.dart';

Widget lessonsListView() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 25.h,
      ),
      Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Text(
            "All Lessons",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22.spMin,
                color: Colors.black),
          ),
        ],
      ),
      Container(
        margin: EdgeInsetsDirectional.only(start: 22.w, end: 22.w, top: 10.h),
        height: 324.h,
        width: 330.w,
        child: ListView.separated(
          padding: EdgeInsetsDirectional.zero,
          physics: BouncingScrollPhysics(),
          itemCount: lessonList.length,
          itemBuilder: (context, index) => lessonCard(
            lesson: lessonList[index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 10.h,
          ),
        ),
      ),
    ],
  );
}
List<Lesson> lessonList = [
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
    name: "Lesson#1",
    description:
    'test notification test notification test notification test notification test notification test notification test notification',
    image: 'assets/images/image.jpg',
  ),
  Lesson(
      name: "Lesson#1",
      description:
      'test notification test notification test notification test notification test notification test notification test notification',
      image: 'assets/images/image.jpg',
      ),
];