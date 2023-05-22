import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/noticctionsScreen/notificationsScreen.dart';

import 'homeScreenSearchTextField.dart';

Widget homeAppBar(BuildContext context) {
  return Directionality(
    textDirection:
        userEntity.language == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      padding: EdgeInsetsDirectional.only(
        top: 50.h,
      ),
      height: 220.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xFF463bce),
            Color(0xff5d54dd),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 18.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userEntity.language == 'Arabic'
                        ? "مرحبا ${userEntity.name.split(' ')[0]}"
                        : "Hey ${userEntity.name.split(' ')[0]}",
                    style: TextStyle(
                        fontSize: 27.spMin,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    userEntity.language == 'Arabic'
                        ? "لنبدأ التعلم"
                        : " Let's Start Learning",
                    style: TextStyle(fontSize: 22.spMin, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30.spMax,
                  ),
                  onPressed: () {
                    // Get.to(notificationsScreen());
                    LayoutCubit.get(context).getUserData();
                  }),
            ],
          ),
          SizedBox(
            height: 54.h,
          ),
          SizedBox(width: 320.w, child: homeScreenSearchTextField()),
        ],
      ),
    ),
  );
}
