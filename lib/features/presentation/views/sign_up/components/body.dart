import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/no_account_text.dart';
import 'package:online_course/features/presentation/views/sign_in/sign_in_screen.dart';
import 'package:online_course/features/presentation/views/translate.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.04), // 4%

                  SizedBox(
                    width: 1.sw / 2.5,
                    child: Text(
                      userEntity.language != 'Arabic' ? Translation.Create_Account1 :Translation.Create_Account2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const SignUpForm(),
                  SizedBox(height: 10.h),

                  SizedBox(height: Get.height * 0.08),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
