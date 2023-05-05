import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';

import '../../../components/custom_textfeild.dart';
import '../../../components/no_account_text.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../main_home_screen/main_home_screen.dart';
import 'package:online_course/features/presentation/controllers/sing_in_cubit/LoginState.dart';
import 'package:online_course/features/presentation/controllers/sing_in_cubit/LoginCubit.dart';

import '../../sign_up/sign_up_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        } else if (state is LoginSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            navigateAndFinish(context, MainHomeScreen());
          }).catchError((error) {
            print(error.toString());
          });
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: 1.sw,
          height: 1.sh * 0.5,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFieldWidget(
                  text: 'Email',
                  controller: email,
                  validator: 'please enter your email address',
                ),
                TextFieldWidget(
                  hint: 'Password',
                  validator: 'please enter your password',
                  controller: password,
                  isHidden: LoginCubit.get(context).isPassword,
                  inkell: LoginCubit.get(context).suffix,
                  onTap: () {
                    LoginCubit.get(context).changePasswordVisibility();
                  },
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 1.sw,
                  child: Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ForgotPasswordScreen());
                        },
                        child: Text(
                          "Forgot Password",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const Spacer(),
                if (state is! LoginLoadingState)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(1.sw, 50),
                          maximumSize: Size(1.sw, 50),
                          foregroundColor: kWhiteColor),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                              email: email.text, password: password.text,context: context );
                        }
                      },
                      child: const Text('Sign In')),
                if (state is LoginLoadingState)
                  Center(
                    child: CircularProgressIndicator(
                      color: mixedColor,
                    ),
                  ),
                SizedBox(height: 20.h),
                NoAccountText(
                  text: "Don’t have an account? ",
                  goTitle: "Sign Up",
                  onTapTitle: () {
                    Get.to(() => const SignUpScreen());
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
