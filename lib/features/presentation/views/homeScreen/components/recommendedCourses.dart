import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/DummyData.dart';

import 'CourseCard.dart';
import 'onGoingCourseCard.dart';

class recommendedCourses extends StatelessWidget {
  const recommendedCourses({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.h),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Row(
            children: [
              Text(
                "Recomended Courses",
                style: TextStyle(
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(width: 79.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 17.spMin,
                    color: Color(0xFF463bce),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 226.h,
          child: GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 1.h,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.935.h,
              crossAxisSpacing: 13.w,
              mainAxisSpacing: 15.h,
            ),
            itemBuilder: (context, index) {
              return courseCard(
                category: categoryList[index],
              );
            },
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }
}
