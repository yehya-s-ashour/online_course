import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:online_course/screens/otp/otp_screen.dart';


import '../../../Theme/styles/colors.dart';
import '../../../components/custom_textfeild.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.04),


              const Text(
                "We need your registration email to send you password reset code!",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height * 0.1),
              const ForgotPassForm(),
            ],
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
          TextFieldWidget(text: 'Email',),







          SizedBox(height: 20.h),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(1.sw,50),
                  maximumSize: Size(1.sw,50),
                  foregroundColor: kWhiteColor
              ),
              onPressed: (){
                Get.to(()=>const OtpScreen());
              }, child: const Text('Send Code')),
        ],
      ),
    );
  }
}
