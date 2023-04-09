import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:Get.height * 0.05),

              const Text("Enter the code we sent your registed email"),
              SizedBox(height:Get.height * 0.08),
              const Text("Did't receive a code?"),

              const OtpForm(),


              SizedBox(height: Get.height * 0.1),

            ],
          ),
        ),
      ),
    );
  }


}
