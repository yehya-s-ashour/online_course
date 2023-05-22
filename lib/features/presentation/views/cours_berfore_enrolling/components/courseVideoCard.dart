import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/video_palyer_widget.dart';

class courseVideoCard extends StatefulWidget {
  final String VideoPaht;
  final String courseId;
  final int rate;
  final int numberSt;
  final bool isLesson;

  const courseVideoCard(
      {super.key,
      required this.VideoPaht,
      required this.rate,
      required this.numberSt,
      required this.isLesson,
      required this.courseId});

  @override
  State<courseVideoCard> createState() => _courseVideoCardState();
}

class _courseVideoCardState extends State<courseVideoCard> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Container(
        height: widget.isLesson
            ? userEntity.courseEnroll.contains(widget.courseId)
                ? 185.h
                : 100.h
            : 190.h,
        width: 310.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4.0.r,
              spreadRadius: 2.0.r,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            if (!widget.isLesson)
              Container(
                margin: EdgeInsetsDirectional.only(top: 1.h),
                height: 150.h,
                width: 310.w,
                child: VideoPlayerCourseItem(videoPath: widget.VideoPaht),
              ),
            if (widget.isLesson &&
                userEntity.courseEnroll.contains(widget.courseId))
              Container(
                margin: EdgeInsetsDirectional.only(top: 1.h),
                height: 180.h,
                width: 310.w,
                child: VideoPlayerCourseItem(videoPath: widget.VideoPaht),
              ),
            if (widget.isLesson &&
                !userEntity.courseEnroll.contains(widget.courseId))
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    userEntity.language == 'Arabic'
                        ? "لا يمكن فتح هذا الدرس \nيرجى التسجيل في الكورس أولا"
                        : 'Couldn\'t open this lesson\nPlease enroll in the course firstly',
                    style: GoogleFonts.cairo(
                        fontSize: 22.spMin, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            if (!widget.isLesson)
              SizedBox(
                height: 5.h,
              ),
            if (!widget.isLesson)
              Row(
                children: [
                  if (widget.rate >= 4)
                    Container(
                      width: 80.w,
                      height: 27.h,
                      margin: EdgeInsetsDirectional.only(start: 55.w),
                      padding: EdgeInsetsDirectional.only(
                          start: 7.w, top: 8.w, bottom: 5.w, end: 5.w),
                      decoration: BoxDecoration(
                          color: mixedColor,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Text(
                        userEntity.language == 'Arabic'
                            ? "الأعلى تقييما"
                            : "Top Rated",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.5.spMin,
                        ),
                      ),
                    ),
                  if (widget.rate >= 4)
                    SizedBox(
                      width: 25.w,
                    ),
                  if (widget.rate < 4)
                    SizedBox(
                      width: 110.w,
                    ),
                  Icon(Icons.people_alt_outlined,
                      color: Colors.black.withOpacity(0.7)),
                  Text(
                    "${widget.numberSt}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.spMin,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(Icons.star,
                      color: Colors.black.withOpacity(0.7), size: 20.spMin),
                  Text(
                    "${widget.rate}",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.spMin,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
