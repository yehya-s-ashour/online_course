import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/Theme/styles/colors.dart';



import '../../../components/custom_textfeild.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../main_home_screen/main_home_screen.dart';



class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFieldWidget(text: 'Email',),


          TextFieldWidget(hint: 'Password',isHidden: true,inkell: const Icon(Icons.remove_red_eye),),

          SizedBox(height: 10.h),
          SizedBox(
            width: 1.sw,
            child: Row(
              children: [

                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(()=>const ForgotPasswordScreen());
                  },
                  child:  Text(
                    "Forgot Password",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(color: kPrimaryColor),
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 20.h),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(1.sw,50),
                maximumSize: Size(1.sw,50),
                foregroundColor: kWhiteColor
              ),
              onPressed: (){
                Get.to(()=>const MainHomeScreen());
              }, child: const Text('Sign In')),
        ],
      ),
    );
  }


}
