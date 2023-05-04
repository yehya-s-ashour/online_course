import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';

import 'package:online_course/features/presentation/controllers/sing_up_cubit/RegisterCubit.dart';
import 'package:online_course/features/presentation/controllers/sing_up_cubit/RegisterState.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';

import '../../../components/no_account_text.dart';
import '../../sign_in/sign_in_screen.dart';

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
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            Get.to(() => const MainHomeScreen());
          } else if (state is CreateUseErrorState) {}
        },
        builder: (context, state) {
          return SizedBox(
            width: 1.sw,
            height: 1.sh*0.6,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldWidget(
                    text: 'Name',
                  ),
                  TextFieldWidget(
                    text: 'Email',
                  ),
                  TextFieldWidget(
                    hint: 'Password',
                    isHidden: true,
                    inkell: const Icon(Icons.remove_red_eye),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(1.sw, 50),
                          maximumSize: Size(1.sw, 50),
                          foregroundColor: kWhiteColor),
                      onPressed: () {
                        RegisterCubit.get(context).userRegister(
                            name: 'Ahmed',
                            email: email!,
                            password: password!);
                      },
                      child: const Text('Sign Up')),
                  SizedBox(height: 20.h),
                  NoAccountText(
                    text: 'Already have an account?',
                    goTitle: 'Sign In',
                    onTapTitle: () {
                      Get.to(() => const SignInScreen());
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}