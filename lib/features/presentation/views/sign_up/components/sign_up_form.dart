import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../Theme/styles/colors.dart';
import '../../../components/custom_textfeild.dart';
import '../../main_home_screen/main_home_screen.dart';



class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFieldWidget(text: 'Name',),
          TextFieldWidget(text: 'Email',),


          TextFieldWidget(hint: 'Password',isHidden: true,inkell: const Icon(Icons.remove_red_eye),),




          SizedBox(height: 20.h),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(1.sw,50),
                  maximumSize: Size(1.sw,50),
                  foregroundColor: kWhiteColor
              ),
              onPressed: (){
                Get.to(()=>const MainHomeScreen());
              }, child: const Text('Sign Up')),
        ],
      ),
    );
  }

}
