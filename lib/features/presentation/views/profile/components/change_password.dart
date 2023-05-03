import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';

class ChangeYourPassword extends StatefulWidget {
  const ChangeYourPassword({Key? key}) : super(key: key);

  @override
  State<ChangeYourPassword> createState() => _ChangeYourPasswordState();
}

class _ChangeYourPasswordState extends State<ChangeYourPassword> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(title: "Create new Password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.04),
              const Text(
                "Your new Password must be different from previous used passwords.",
              ),
              SizedBox(height: Get.height * 0.11),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      hint: 'New Password',
                      isHidden: true,
                      inkell: const Icon(Icons.remove_red_eye),
                    ),
                    TextFieldWidget(
                      hint: 'Confirm Password',
                      isHidden: true,
                    ),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            minimumSize: Size(1.sw, 55),
                            maximumSize: Size(1.sw, 55),
                            foregroundColor: kWhiteColor,
                            backgroundColor: kPrimaryColor),
                        onPressed: () {},
                        child: const Text('Reset Password')),
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
