import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';
import 'package:online_course/features/presentation/views/splash/splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      if (uid != null) {
        navigateAndFinish(context, MainHomeScreen());
      } else {
        navigateAndFinish(context, IntroScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100.h,
              width: 180.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              width: 220,
              height: 4,
              color: Colors.white,
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 50.h,
              width: 220.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/font1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
