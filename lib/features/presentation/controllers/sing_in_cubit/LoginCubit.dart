import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';
import 'package:online_course/features/data/models/user_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';

import 'LoginState.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      LayoutCubit.get(context).getUserData().then((val) {
        getUserData(uid: value.user!.uid).then((valu) {
          emit(LoginSuccessState(value.user!.uid));
        });

      });
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
  Future<void> getUserData({required String uid}) async {
    emit(GetUserLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      userEntity = UserModel.fromMap(value.data()!);
      CacheHelper.saveData(key: 'courseEnroll', value: userEntity.courseEnroll);
      CacheHelper.saveData(
          key: 'userEntity',
          value:
          '${userEntity.uId},${userEntity.name},${userEntity.password},${userEntity.email},${userEntity.language},${userEntity.theme},${userEntity.profilePic},${userEntity.bio},${userEntity.token},${userEntity.wallpaper},${userEntity.isTeacher}');
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
