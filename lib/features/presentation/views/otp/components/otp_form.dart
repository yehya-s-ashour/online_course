import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/no_account_text.dart';
import 'package:online_course/features/presentation/views/constants.dart';
import 'package:online_course/features/presentation/views/forgot_password/Reset_password/reset_password_screen.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: TextFormField(
                    autofocus: true,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration(circle: 5, filled: true),
                    onChanged: (value) {
                      nextField(value, pin2FocusNode);
                    },
                  ),
                ),
                SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration(circle: 5, filled: true),
                    onChanged: (value) => nextField(value, pin3FocusNode),
                  ),
                ),
                SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration(circle: 5, filled: true),
                    onChanged: (value) => nextField(value, pin4FocusNode),
                  ),
                ),
                SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration(
                      circle: 5,
                      filled: true,
                    ),
                    onChanged: (value) => nextField(value, pin5FocusNode),
                  ),
                ),
                SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: otpInputDecoration(
                      circle: 5,
                      filled: true,
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4FocusNode!.unfocus();
                        // Then you need to check is the code is correct or not
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children:  [
                Spacer(),
                NoAccountText(
                    text: userEntity.language == 'Arabic' ? Translation.Didn_receive_a_code1 :Translation.Didn_receive_a_code2, goTitle: userEntity.language == 'Arabic' ? Translation.Resent_code1 :Translation.Resent_code2),
              ],
            ),
            SizedBox(height: Get.height * 0.12),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(1.sw, 50),
                    maximumSize: Size(1.sw, 50),
                    foregroundColor: kWhiteColor),
                onPressed: () {
                  Get.to(() => const ResetPasswordScreen());
                },
                child: Text(userEntity.language == 'Arabic' ? Translation.Confirm1 :Translation.Confirm2))
          ],
        ),
      ),
    );
  }
}
