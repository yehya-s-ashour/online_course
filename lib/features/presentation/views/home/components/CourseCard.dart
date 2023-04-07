import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 280,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff5d54dd),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Container(
                  height: 55.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(course.image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 25,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    course.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              width: 238.0.w,
              lineHeight: 10.0.h,
              percent: 0.4,
              barRadius: Radius.circular(5),
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 120.w,
                ),
                Text(
                  "63 Lessons",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Colors.white),
                ),
              ],
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
                      fontSize: 10,
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
                      fontSize: 12,
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
                      fontSize: 10,
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
