import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class upperCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numberOfCourses = (LayoutCubit.get(context).completedEnrollModel.length+LayoutCubit.get(context).onGoginEnrollModel.length);
    return Column(
      children: [
        Container(
          width: 320.w,
          height: 180,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 4.0.r,
                spreadRadius: .05.r,
              ), //BoxShadow
            ],
            color: mixedColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 15.w, top: 12.h),
                child: Text(
                  "Enrolled in $numberOfCourses courses",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21.spMin,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 145.w, top: 7.h),
                child: SvgPicture.asset(
                  "assets/images/myCoursesSVG2.svg",
                  height: 200,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 42.h, start: 15),
                child: Text(
                  "Completed Courses",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.spMin,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 62.h, start: 5.w),
                child: LinearPercentIndicator(
                  width: 160.0.w,
                  lineHeight: 7.0.h,
                  percent: numberOfCourses==0?0:LayoutCubit.get(context).completedEnrollModel.length/numberOfCourses,
                  barRadius: Radius.circular(5.r),
                  backgroundColor:
                      Color.fromARGB(255, 249, 248, 248).withOpacity(0.2),
                  progressColor: Color(0xFFFCBC63),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 72.h, start: 3.w),
                child: Row(children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    "${LayoutCubit.get(context).completedEnrollModel.length}  Courses",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.spMin,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 42.w,
                  ),
                  Text(
                    "${numberOfCourses} Courses",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.spMin,
                        color: Colors.white),
                  ),
                ]),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
