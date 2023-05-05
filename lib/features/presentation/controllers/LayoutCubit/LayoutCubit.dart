import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';
import 'package:online_course/features/data/models/courses_model.dart';
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

  List<CoursesModel> businessCourses=[];
  Future<void> getBusinessCourses() async {
    emit(GetBusinessCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Business')
        .doc('1')
        .collection('Communications')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        businessCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetBusinessCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessCoursesErrorState(error.toString()));
    });
    emit(GetBusinessCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Business')
        .doc('1')
        .collection('Sales')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        businessCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetBusinessCoursesSuccessState());
    }).catchError((error) {
      emit(GetBusinessCoursesErrorState(error.toString()));
    });
  }

  List<CoursesModel> developmentCourses=[];
  Future<void> getDevelopmentCourses() async {
    emit(GetDevelopmentCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Development')
        .doc('1')
        .collection('Web Development')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        developmentCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetDevelopmentCoursesSuccessState());
    }).catchError((error) {
      emit(GetDevelopmentCoursesErrorState(error.toString()));
    });
    emit(GetDevelopmentCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Development')
        .doc('1')
        .collection('Data Science')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        developmentCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetDevelopmentCoursesSuccessState());
    }).catchError((error) {
      emit(GetDevelopmentCoursesErrorState(error.toString()));
    });
  }

  List<CoursesModel> marketingCourses=[];
  Future<void> getMarketingCourses() async {
    emit(GetMarketingCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Marketing')
        .doc('1')
        .collection('Paid Advertising')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        marketingCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetMarketingCoursesSuccessState());
    }).catchError((error) {
      emit(GetMarketingCoursesErrorState(error.toString()));
    });
    emit(GetMarketingCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Marketing')
        .doc('1')
        .collection('Digital Marketing')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        marketingCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetMarketingCoursesSuccessState());
    }).catchError((error) {
      emit(GetMarketingCoursesErrorState(error.toString()));
    });
  }

  List<CoursesModel> personalDevelopmentCourses=[];
  Future<void> getPersonalDevelopmentCourses() async {
    emit(GetPersonalDevelopmentCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Personal Development')
        .doc('1')
        .collection('Creativity')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        personalDevelopmentCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetPersonalDevelopmentCoursesSuccessState());
    }).catchError((error) {
      emit(GetPersonalDevelopmentCoursesErrorState(error.toString()));
    });
    emit(GetPersonalDevelopmentCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Personal Development')
        .doc('1')
        .collection('Leadership')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        personalDevelopmentCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetPersonalDevelopmentCoursesSuccessState());
    }).catchError((error) {
      emit(GetPersonalDevelopmentCoursesErrorState(error.toString()));
    });
  }

  List<CoursesModel> teachingAcademicsCourses=[];
  Future<void> getTeachingAcademicsCourses() async {
    emit(GetTeachingAcademicsCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Teaching & Academics')
        .doc('1')
        .collection('Math')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        teachingAcademicsCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetTeachingAcademicsCoursesSuccessState());
    }).catchError((error) {
      emit(GetTeachingAcademicsCoursesErrorState(error.toString()));
    });
    emit(GetTeachingAcademicsCoursesLoadinState());
    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection('Teaching & Academics')
        .doc('1')
        .collection('Physics')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        teachingAcademicsCourses.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetTeachingAcademicsCoursesSuccessState());
    }).catchError((error) {
      emit(GetTeachingAcademicsCoursesErrorState(error.toString()));
    });
  }
  int currentindex =0;
  void changeIndex(int index){
    emit(ChangeIndexLoadinState());
    currentindex=index;
    emit(ChangeIndexSuccessState());
  }
}