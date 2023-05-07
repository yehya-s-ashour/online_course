import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/lesson_model.dart';

class lessonCard extends StatelessWidget {
  final LessonModel lesson;
  const lessonCard({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 83.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4.0.r,
              spreadRadius: .05.r,
              offset: Offset(0, 4.0.r),
            ),
          ],
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Container(
                  height: 53.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      image: DecorationImage(
                          image: NetworkImage(lesson.image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.w,
                    ),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        lesson.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.spMin,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.h,
                        ),
                        SizedBox(
                          width: 175.w,
                          child: Text(
                            lesson.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14.5.spMin,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.45)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "4:11",
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
