import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



import '../../../Theme/styles/colors.dart';
import '../../../components/no_account_text.dart';
import '../../sign_in/sign_in_screen.dart';
import '../sign_up_screen.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.04), // 4%

                SizedBox(
                  width: 1.sw/2.5,
                  child: const Text(
                    "Create Account",
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
                 NoAccountText(text: 'Already have an account?',goTitle: 'Sign In',onTapTitle:  (){
                  Get.to(()=>const SignInScreen());
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
