import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/views/translate.dart';


import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,

      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:Get.height * 0.05),

                Text(userEntity.language == 'Arabic' ? Translation.Enter_the_code_we_sent_your_registered_email1 :Translation.Enter_the_code_we_sent_your_registered_email2,),
                SizedBox(height:Get.height * 0.08),
                Text(userEntity.language == 'Arabic' ? Translation.Didn_receive_a_code1 :Translation.Didn_receive_a_code2,),

                const OtpForm(),


                SizedBox(height: Get.height * 0.1),

              ],
            ),
          ),
        ),
      ),
    );
  }


}
