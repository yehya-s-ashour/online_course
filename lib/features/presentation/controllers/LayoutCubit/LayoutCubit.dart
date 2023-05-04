import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';
import 'package:online_course/features/data/models/user_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);


  Future<void> getUserData() async {
    emit(GetUserLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      // print(value.data());
      userEntity = UserModel.fromMap(value.data()!);
      CacheHelper.saveData(key: 'userEntity',
          value: '${userEntity.uId},${userEntity.name},${userEntity.password},${userEntity.email},${userEntity.language},${userEntity.theme},${userEntity.profilePic},${userEntity.bio},${userEntity.token},${userEntity.wallpaper}');
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }
}