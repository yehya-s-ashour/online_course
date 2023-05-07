import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';
import 'package:online_course/features/presentation/views/cours_berfore_enrolling/courseBrforeEnrolling.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/starsRating.dart';

class CourseCardd extends StatelessWidget {
  final CourseModel courseModel;

  CourseCardd({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  int rate = 0;

  @override
  Widget build(BuildContext context) {
    courseModel.rate.forEach((element) {
      rate += element;
    });
    return InkWell(
      onTap: () {
        Get.to(
          courseBrforeEnrollingScreen(
            courseModel: courseModel,
            rate: courseModel.rate.length == 0
                ? 0
                : (rate / courseModel.rate.length).round(),
          ),
        );
      },
      child: Container(
        height: 5.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 4.0.r,
              spreadRadius: .05.r,
            ),
          ],
        ),
        child: Column(
          children: [
            CustomImage(
              courseModel.image,
              isNetwork: true,
              width: 200.w,
              height: 100.h,
              radius: 12.r,
            ),
            // Container(
            //   height: 100.h,
            //   width: 200.w,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12.r),
            //       image: DecorationImage(
            //           image: NetworkImage(courseModel.image),
            //           fit: BoxFit.cover)),
            // ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 7.w,
                ),
                SizedBox(
                  width: 150.w,
                  child: Text(
                    courseModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12.5.spMin,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  "${courseModel.numberOfLessons} Lessons",
                  style: TextStyle(
                      fontSize: 11.spMin,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 153, 151, 151)),
                ),
                Spacer(),
                starsRating(
                    rating: courseModel.rate.length == 0
                        ? 0
                        : (rate / courseModel.rate.length).round()),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
