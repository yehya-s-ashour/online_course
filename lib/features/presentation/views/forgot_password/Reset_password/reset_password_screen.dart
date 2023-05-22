import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: MyAppBar(
          title: userEntity.language == 'Arabic' ? Translation.Reset_Password1 :Translation.Reset_Password2,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.04),
                 Text(
                   userEntity.language == 'Arabic' ? Translation.Enter_a_new_password1 :Translation.Enter_a_new_password2,                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * 0.11),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        hint: userEntity.language == 'Arabic' ? Translation.New_Password1 :Translation.New_Password2,
                        isHidden: true,
                        inkell: Icons.remove_red_eye,
                      ),
                      TextFieldWidget(
                        hint:userEntity.language == 'Arabic' ? Translation.Confirm_Password1 :Translation.Confirm_Password2,
                        isHidden: true,
                        inkell: Icons.remove_red_eye,
                      ),
                      SizedBox(height: 50.h),

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(1.sw, 50),
                              maximumSize: Size(1.sw, 50),
                              foregroundColor: kWhiteColor),
                          onPressed: () {},
                          child:  Text(
                              userEntity.language == 'Arabic' ? Translation.Sign_In1 :Translation.Sign_In2,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
