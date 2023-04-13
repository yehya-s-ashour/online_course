import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/presentation/components/no_account_text.dart';
import 'package:online_course/features/presentation/views/sign_up/sign_up_screen.dart';

import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.04),
                SizedBox(
                  width: 1.sw / 2.1,
                  child:  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.08),
                const SignForm(),
                SizedBox(height: 10.h),

                SizedBox(height: Get.height * 0.08),
                SizedBox(height: 20.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
