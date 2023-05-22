import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/starsRating.dart';

class notificationCard extends StatelessWidget {
  final Notifications notification;
  const notificationCard({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: SizedBox(
        height: 75.h,
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
          child: Row(children: [
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Container(
                  height: 45.h,
                  width: 47.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      image: DecorationImage(
                          image: AssetImage(notification.image),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 225.w,
                      child: Text(
                        notification.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17.spMin,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      userEntity.language == 'Arabic'
                          ? "منذ 2 دقيقة"
                          : "2 minutes ago",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.spMin,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 156, 153, 153)),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
