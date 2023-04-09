import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/Theme/styles/colors.dart';

import 'package:online_course/screens/splash/splash_screen.dart';







class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () =>Get.offAll(()=>const IntroScreen()));


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
backgroundColor: kPrimaryColor,
      body:   Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
    width: 100,
    decoration: const BoxDecoration(
    image:DecorationImage(image: AssetImage('assets/images/logoW.png'),fit: BoxFit.cover,)
    ),),
            Text('KR LEARNING',style: Theme.of(context).textTheme.headline2!.copyWith(color: kWhiteColor),),
            Text('APP BY KAWSER AHMED',style: Theme.of(context).textTheme.subtitle2!.copyWith(color: kWhiteColor),)
          ],
        ),
      ),
    );
  }
}
