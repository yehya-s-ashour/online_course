import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/components/cutom_appbar.dart';

import '../../../Theme/styles/colors.dart';
import '../../../components/custom_textfeild.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(title: "Reset Password",),
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.04),


              const Text(
                "Enter a new password",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height * 0.11),
              Form(
                key: _formKey,
                child: Column(
                  children: [



                    TextFieldWidget(hint: 'New Password',isHidden: true,inkell: const Icon(Icons.remove_red_eye),),
                    TextFieldWidget(hint: 'Confirm Password',isHidden: true,inkell: const Icon(Icons.remove_red_eye),),



                    SizedBox(height: 30.h),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(1.sw,50),
                            maximumSize: Size(1.sw,50),
                            foregroundColor: kWhiteColor
                        ),
                        onPressed: (){}, child: const Text('Sign In')),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
