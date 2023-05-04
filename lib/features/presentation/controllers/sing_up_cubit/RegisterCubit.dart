import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';
import 'package:online_course/features/data/models/user_model.dart';
import 'package:online_course/features/domain/entities/user.dart';

import 'RegisterState.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.toString());
      print(value.user!.uid);
      userCreate(
        name: name,
        email: email,
        password: password,
        uId: value.user!.uid,
      );
      emit(RegisterSuccessState(value.user!.uid));
    }).catchError((error) {
      print('hhhhhhh');
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String password,
    required String name,
    required String uId,
  }) {
    userEntity = UserEntity(
      name: name,
      bio: '',
      email: email,
      password: password,
      uId: uId,
      theme: 'Light',
      language: 'English',
      profilePic: '',
      token: '',
      wallpaper: '',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userEntity.toMap())
        .then((value) {
          CacheHelper.saveData(key: 'userEntity', value: '$uId,$name,$password,$email,${'English'},${'Light'},,,,');
      emit(CreateUserSuccessState(userEntity.uId));
    }).catchError((error) {
      print(error.toString());
      emit(CreateUseErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    emit(RegisterChangePasswordVisibilityLoadingState());
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }
}
