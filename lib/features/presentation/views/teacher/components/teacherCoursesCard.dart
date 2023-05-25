import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/data/models/courses_model.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';
import 'package:online_course/features/presentation/views/teacher/editCourseDetails/editCourseDetails.dart';

class teacherCoursesCard extends StatelessWidget {
  final CoursesModel course;
  const teacherCoursesCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
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
                CustomImage(
                  course.image,
                  isNetwork: true,
                  radius: 15.r,
                  height: 80,
                  width: 80.w,
                ),
                // Container(
                //   height: 80.h,
                //   width: 80.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20.r),
                //       image: DecorationImage(
                //           image: AssetImage(course.image), fit: BoxFit.cover)),
                // ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.w,
                    ),
                    SizedBox(
                      width: 155.w,
                      child: Text(
                        course.name,
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
                          width: 7.h,
                        ),
                        SizedBox(
                          width: 145.w,
                          child: Text(
                            course.description,
                            maxLines: 2,
                            textAlign: TextAlign.justify,
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
              width: 5.w,
            ),
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2.spMin,
                    blurRadius: 2.spMin,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 30.spMax,
                  ),
                  onPressed: () {
                    Get.to(editCourseDetails(
                      course: course,
                    ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
