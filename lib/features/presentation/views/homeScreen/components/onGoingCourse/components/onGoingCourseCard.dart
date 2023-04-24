import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class onGoingCourseCard extends StatelessWidget {
  final Course course;
  const onGoingCourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 248.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 4.0.r,
              spreadRadius: .05.r,
            ), //BoxShadow
          ],
          color: const Color(0xff5d54dd),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Container(
                  height: 55.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                          image: AssetImage(course.image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 17.w,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    course.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18.spMin,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            LinearPercentIndicator(
              width: 228.0.w,
              lineHeight: 10.0.h,
              percent: 0.4,
              barRadius: Radius.circular(5.r),
              backgroundColor:
                  Color.fromARGB(255, 246, 244, 244).withOpacity(0.2),
              progressColor: Color(0xFFFCBC63),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  "43 Lessons",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.spMin,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 110.w,
                ),
                Text(
                  "63 Lessons",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.spMin,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 78.w,
                ),
                Text(
                  "64 Video",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.spMin,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '٠',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12.spMin,
                      color: Color.fromARGB(255, 196, 193, 193)),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "27 Quiz",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.spMin,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
