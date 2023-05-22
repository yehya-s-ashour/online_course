import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/views/otp/otp_screen.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.04),
                 Text(
                  userEntity.language == 'Arabic' ? Translation.We_need_your_registration_email_to_send_you_a_password_reset_code1 :Translation.We_need_your_registration_email_to_send_you_a_password_reset_code2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * 0.1),
                const ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFieldWidget(
            text:userEntity.language == 'Arabic' ? Translation.E_mail1 :Translation.E_mail2,
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(1.sw, 50),
                  maximumSize: Size(1.sw, 50),
                  foregroundColor: kWhiteColor),
              onPressed: () {
                Get.to(() => const OtpScreen());
              },
              child:  Text(
                  userEntity.language == 'Arabic' ? Translation.Send_Code1 :Translation.Send_Code2,
              )),
        ],
      ),
    );
  }
}
