import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/components/no_account_text.dart';


import '../../../Theme/styles/colors.dart';
import '../../sign_up/sign_up_screen.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal:20.w),
          child: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height* 0.04),
                SizedBox(
                  width: 1.sw/2.5,
                  child: const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: Get.height * 0.08),
                const SignForm(),
                SizedBox(height: 10.h),
                 NoAccountText(text: "Don’t have an account? ", goTitle:"Sign Up",onTapTitle:  (){
                  Get.to(()=>SignUpScreen());
                },),
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
