import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';

class lessonCard extends StatelessWidget {
  final LessonModel lesson;
  const lessonCard({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73.h,
      // clipBehavior: Clip.none,
      decoration: BoxDecoration(

        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0.r,
            spreadRadius: 2.0.r,
            offset: Offset(0, 0),

          ),
        ],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(
                width: 6.w,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 5.w, end: 15.w),
                child: CustomImage(
                  lesson.image,
                  isNetwork: true,
                  width: 52.w,
                  height: 50.h,
                  radius: 25.r,
                ),
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
                      maxLines: 1,
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
                        width: 190.w,
                        child: Text(
                          lesson.description,
                          maxLines: 2,
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
    );
  }
}
