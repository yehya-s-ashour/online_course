import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/controllers/sing_up_cubit/RegisterCubit.dart';
import 'package:online_course/features/presentation/controllers/sing_up_cubit/RegisterState.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';
import 'package:online_course/features/presentation/views/translate.dart';
import '../../../components/no_account_text.dart';
import '../../sign_in/sign_in_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is CreateUserSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            navigateAndFinish(context, MainHomeScreen());
          }).catchError((error) {
            print(error.toString());
          });
        } else if (state is CreateUseErrorState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: userEntity.language == 'Arabic'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: SizedBox(
            width: 1.sw,
            height: 1.sh * 0.6,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldWidget(
                    // userEntity.language != 'Arabic' ? Translation.Name :Translation.Create_Account2,
                    text: 'Name',
                    controller: name,
                    validator: 'please enter your name',
                  ),
                  TextFieldWidget(
                    text: 'Email',
                    controller: email,
                    validator: 'please enter your email address',
                  ),
                  TextFieldWidget(
                    hint: 'Password',
                    validator: 'please enter your password',
                    controller: password,
                    isHidden: RegisterCubit.get(context).isPassword,
                    inkell: RegisterCubit.get(context).suffix,
                    onTap: () {
                      RegisterCubit.get(context).changePasswordVisibility();
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 20.0),
                        child: Text(
                          "Start As:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (state is! RegisterLoadingState)
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(1.sw, 50),
                            maximumSize: Size(1.sw, 50),
                            foregroundColor: kWhiteColor),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            RegisterCubit.get(context).userRegister(
                                name: name.text,
                                email: email.text,
                                password: password.text,
                                isTeacher: dropdownValue=='Teacher'?true:false);
                          }
                        },
                        child: Text(
                          userEntity.language != 'Arabic'
                              ? Translation.Sign_up1
                              : Translation.Sign_up2,
                        )),
                  if (state is RegisterLoadingState)
                    Center(
                      child: CircularProgressIndicator(
                        color: mixedColor,
                      ),
                    ),
                  SizedBox(height: 20.h),
                  NoAccountText(
                    text: userEntity.language != 'Arabic'
                        ? Translation.Already_have_an_account1
                        : Translation.Already_have_an_account2,
                    goTitle: userEntity.language != 'Arabic'
                        ? Translation.Sign_In1
                        : Translation.Sign_In2,
                    onTapTitle: () {
                      Get.to(() => const SignInScreen());
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

List<String> list = <String>[
  'Student',
  'Teacher',
];
