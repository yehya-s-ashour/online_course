import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class ChangeYourPassword extends StatefulWidget {
  const ChangeYourPassword({Key? key}) : super(key: key);

  @override
  State<ChangeYourPassword> createState() => _ChangeYourPasswordState();
}

class _ChangeYourPasswordState extends State<ChangeYourPassword> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,

      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: MyAppBar(
              title: userEntity.language == 'Arabic' ? Translation.Create_new_Password1 :Translation.Create_new_Password2,
              backgroundColor: kPrimaryColor,
              color: Colors.white,
              titleColor: Colors.white,
              ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.04),
                 Text(
                   userEntity.language == 'Arabic' ? Translation.Your_new_Password_must_be_different_from_previously_used_passwords1 :Translation.Your_new_Password_must_be_different_from_previously_used_passwords2,
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
                        hint: userEntity.language == 'Arabic' ? Translation.Confirm_Password1 :Translation.Confirm_Password2,
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
                          child:  Text(userEntity.language == 'Arabic' ? Translation.Reset_Password1 :Translation.Reset_Password2)),
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
