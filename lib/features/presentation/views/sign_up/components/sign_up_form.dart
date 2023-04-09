import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../Theme/styles/colors.dart';
import '../../../components/custom_textfeild.dart';
import '../../main_home_screen/main_home_screen.dart';
import 'package:online_course/features/data/models/DummyData.dart';

import 'package:online_course/features/presentation/controllers/sing_up_cubit/RegisterCubit.dart';
import 'package:online_course/features/presentation/controllers/sing_up_cubit/RegisterState.dart';



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
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            Get.to(()=>const MainHomeScreen());
          } else if (state is CreateUseErrorState) {
          }
        },
        builder: (context, state) {
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
                      RegisterCubit.get(context).userRegister(
                          name: 'Ahmed',
                          phone: '0598376479',
                          email: email,
                          password: password);

                    }, child: const Text('Sign Up')),
              ],
            ),
          );
        },
      ),
    );
  }
}

