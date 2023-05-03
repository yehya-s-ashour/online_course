import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(title: "Support",backgroundColor:kPrimaryColor ,color: Colors.white,titleColor: Colors.white,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.02),
               CircleAvatar(
                backgroundColor: kPrimaryColor,
                foregroundColor: kWhiteColor,
                radius: 60.r,child: Icon(Icons.support_agent_outlined,color: kWhiteColor,size: 70.r,),),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 35.h),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: const Text('Your Name:', style: TextStyle(fontSize: 18)),
                    ),
                    TextFieldWidget(
                      isHidden: false,
                      padding: EdgeInsets.only(top: 0.01.sh),
                    ),
                    SizedBox(height: 20.h),

                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: const Text('E-mail:', style: TextStyle(fontSize: 18)),
                    ),
                    TextFieldWidget(
                      isHidden: false,
                      padding: EdgeInsets.only(top: 0.01.sh),
                      // borderRaduis: 30.r,
                      // borderRadius: BorderRadius.circular(30.r),
                      // enabledBorderRadius: BorderRadius.circular(30.r),
                      // focusedErrorBorderRadius: BorderRadius.circular(30.r),
                      // focusedBorderRadius: BorderRadius.circular(30.r),
                    ),
                    SizedBox(height: 20.h),

                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: const Text('Phone number:', style: TextStyle(fontSize: 18)),
                    ),
                    TextFieldWidget(
                      isHidden: false,
                      textInputType: TextInputType.phone,
                      padding: EdgeInsets.only(top: 0.01.sh),
                      // borderRaduis: 30.r,
                      // borderRadius: BorderRadius.circular(30.r),
                      // enabledBorderRadius: BorderRadius.circular(30.r),
                      // focusedErrorBorderRadius: BorderRadius.circular(30.r),
                      // focusedBorderRadius: BorderRadius.circular(30.r),
                    ),
                    SizedBox(height: 20.h),

                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: const Text('Problem description:', style: TextStyle(fontSize: 18)),
                    ),
                    TextFieldWidget(
                      isHidden: false,
                      maxLine: 6,
                      padding: EdgeInsets.only(top: 0.01.sh),
                      // borderRaduis: 20.r,
                      // borderRadius: BorderRadius.circular(20.r),
                      // enabledBorderRadius: BorderRadius.circular(20.r),
                      // focusedErrorBorderRadius: BorderRadius.circular(20.r),
                      // focusedBorderRadius: BorderRadius.circular(20.r),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: kWhiteColor,
                    minimumSize: Size(150.w, 45.h),
                  ),
                  onPressed: (){

                  }, child: const Text('Send')),
            ],
          ),
        ),
      ),
    );
  }

}
