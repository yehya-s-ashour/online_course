import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';

Widget enrollCard({required Course courseModel,required BuildContext context}) {
  return Padding(
    padding: EdgeInsetsDirectional.only(top: 20.h, start: 20.w, end: 20.w),
    child: Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            CustomPaint(
              size: Size(430, (270 * 0.3125).toDouble()),
              painter: RPSCustomPainter(),
            ),
          ],
        ),
        if(userEntity.courseEnroll.contains(courseModel.courseId))
        Positioned(
          left: 10.w,
          child: Container(
            width: 55.0,
            height: 55.0,
            decoration: BoxDecoration(
              color: mixedColor,
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: mixedColor!.withOpacity(0.3),
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.message_sharp,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {},
            ),
          ),
        ),
        if(!userEntity.courseEnroll.contains(courseModel.courseId))
        Positioned(
          left: 212.w,
          top: 23.h,
          child: InkWell(
            onTap: () {
              LayoutCubit.get(context).setCoursesEnroll(coursesModel: courseModel);
            },
            child: Container(
              width: 100.0,
              height: 55.0,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: mixedColor!.withOpacity(0.25),
                    blurRadius: 7.0,
                    spreadRadius: 1.5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Enroll Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.5.spMin,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 85.w,
          top: 27.h,
          child: Center(
            child: Text(
              "Course Price",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18.spMin,
              ),
            ),
          ),
        ),
        Positioned(
          left: 95.w,
          top: 47.h,
          child: Center(
            child: Text(
              "Free",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18.spMin,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = mixedColor!
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.9992188, size.height * 0.7943000);
    path0.quadraticBezierTo(size.width * 1.0000312, size.height * 1.0011000,
        size.width * 0.9382812, size.height);
    path0.quadraticBezierTo(size.width * 0.2814453, size.height,
        size.width * 0.0625000, size.height);
    path0.quadraticBezierTo(size.width * 0.0015625, size.height * 0.9850000, 0,
        size.height * 0.7925000);
    path0.quadraticBezierTo(size.width * -0.0023437, size.height * 0.6050000,
        size.width * 0.0656250, size.height * 0.5950000);
    path0.cubicTo(
        size.width * 0.0804688,
        size.height * 0.5950000,
        size.width * 0.1205625,
        size.height * 0.5970000,
        size.width * 0.1433750,
        size.height * 0.5956000);
    path0.cubicTo(
        size.width * 0.1827187,
        size.height * 0.5842000,
        size.width * 0.2010000,
        size.height * 0.4728000,
        size.width * 0.2106250,
        size.height * 0.4072000);
    path0.cubicTo(
        size.width * 0.2182812,
        size.height * 0.3423000,
        size.width * 0.2203438,
        size.height * 0.3095000,
        size.width * 0.2270313,
        size.height * 0.1320000);
    path0.cubicTo(
        size.width * 0.2300625,
        size.height * 0.0601000,
        size.width * 0.2440937,
        size.height * 0.0007000,
        size.width * 0.2806875,
        0);
    path0.quadraticBezierTo(size.width * 0.4277500, size.height * -0.0101000,
        size.width * 0.9375000, 0);
    path0.quadraticBezierTo(size.width * 1.0039063, size.height * 0.0150000,
        size.width, size.height * 0.2000000);
    path0.cubicTo(
        size.width * 0.9999922,
        size.height * 0.3493750,
        size.width * 1.0013125,
        size.height * 0.3368000,
        size.width * 0.9992188,
        size.height * 0.7943000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
