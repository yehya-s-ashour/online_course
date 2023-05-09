import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';
import 'package:online_course/features/data/models/courseEnroll_model.dart';
import 'package:online_course/features/data/models/courses_model.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:online_course/features/data/models/roadmap_model.dart';
import 'package:online_course/features/data/models/user_model.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  Future<void> getUserData() async {
    print('Ahmeddddddddddddddddddddd');
    emit(GetUserLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
      print('Ahmsssssssssssssssss');
      userEntity = UserModel.fromMap(value.data()!);
      print('AhmKKKKKKKKKKKKKKKK');
      CacheHelper.saveData(key: 'courseEnroll', value: userEntity.courseEnroll);
      CacheHelper.saveData(
          key: 'userEntity',
          value:
              '${userEntity.uId},${userEntity.name},${userEntity.password},${userEntity.email},${userEntity.language},${userEntity.theme},${userEntity.profilePic},${userEntity.bio},${userEntity.token},${userEntity.wallpaper},${userEntity.courseEnroll}');
      emit(GetUserSuccessState());
    }).catchError((error) {
      print('Ahmwwwwwwwwwwwwwwwwwwwwwww');
      emit(GetUserErrorState(error.toString()));
    });
  }

  List<CoursesModel> businessCourses = [];

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

  List<CoursesModel> developmentCourses = [];

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

  List<CoursesModel> marketingCourses = [];

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

  List<CoursesModel> personalDevelopmentCourses = [];

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

  List<CoursesModel> teachingAcademicsCourses = [];

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

  Stream<List<LessonModel>> getLessonsCourses(
      {required String mainCategory,
      required String courseId,
      required String subCategory}) {
    List<LessonModel> lessonsCourses = [];
    emit(GetLessonCoursesLoadinState());
    return FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection(mainCategory)
        .doc('1')
        .collection(subCategory)
        .doc(courseId)
        .collection('Lessons')
        .orderBy('creationDate')
        .snapshots()
        .map((value) {
      value.docs.forEach((element) {
        print('aaaaaaaaa${element.data()}');
        lessonsCourses.add(LessonModel.fromMap(element.data()));
      });
      return lessonsCourses;
    });
  }

  Map<String, RoadmapModel> roadmap = {};

  Future<void> getRoadmap() async {
    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Communication')
        .get()
        .then((value) {
      roadmap.addAll({'Communication': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });

    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Creativity')
        .get()
        .then((value) {
      roadmap.addAll({'Creativity': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });

    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Data science')
        .get()
        .then((value) {
      roadmap.addAll({'Data science': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });

    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Digital Marking')
        .get()
        .then((value) {
      roadmap.addAll({'Digital Marking': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });

    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Leader Ship')
        .get()
        .then((value) {
      roadmap.addAll({'Leader Ship': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });

    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Paid Advertising')
        .get()
        .then((value) {
      roadmap.addAll({'Paid Advertising': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });

    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Photography & Video')
        .get()
        .then((value) {
      roadmap
          .addAll({'Photography & Video': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });

    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Saels')
        .get()
        .then((value) {
      roadmap.addAll({'Saels': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });

    emit(GetRoadmapLoadinState());
    await FirebaseFirestore.instance
        .collection('Roadmap')
        .doc('Web Devlopment')
        .get()
        .then((value) {
      roadmap.addAll({'Web Devlopment': RoadmapModel.fromMap(value.data()!)});
      emit(GetRoadmapSuccessState());
    }).catchError((error) {
      emit(GetRoadmapErrorState(error));
    });
    print('wwwwwwwwwwwwwwwwwwwwww${roadmap.length}');
  }

  List<CoursesModel> allCourses = [];

  void getAllCourses() {
    allCourses = [];
    emit(GetAllCoursesLoadinState());
    allCourses.addAll(businessCourses);
    allCourses.addAll(developmentCourses);
    allCourses.addAll(marketingCourses);
    allCourses.addAll(personalDevelopmentCourses);
    allCourses.addAll(teachingAcademicsCourses);
    emit(GetAllCoursesSuccessState());
  }

  int currentindex = 0;

  void changeIndex(int index) {
    emit(ChangeIndexLoadinState());
    currentindex = index;
    emit(ChangeIndexSuccessState());
  }

  Future<void> setCoursesEnroll({required Course coursesModel}) async {
    emit(SetCourseEnrollLoadinState());
    CourseEnrollModel courseEnrollModel = CourseEnrollModel(
        image: coursesModel.image,
        name: coursesModel.name,
        description: 0,
        numberOfLessons: coursesModel.numberOfLessons,
        creationDate: coursesModel.creationDate,
        courseId: coursesModel.courseId,
        mainCategory: coursesModel.mainCategory,
        subCategory: coursesModel.subCategory,
        lessonsSeen: []);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('CoursesEnroll')
        .doc(coursesModel.courseId)
        .set(courseEnrollModel.toMap())
        .then((value) {
      userEntity.courseEnroll.add(coursesModel.courseId);
      FirebaseFirestore.instance
          .collection('users')
          .doc(userEntity.uId)
          .update({'courseEnroll': userEntity.courseEnroll});
      emit(SetCourseEnrollSuccessState());
    }).catchError((error) {
      emit(SetCourseEnrollErrorState(error));
    });
  }

  Stream<List<CourseEnrollModel>> getCoursesEnroll(){
    List<CourseEnrollModel> courseEnrollModel =[];
    emit(GetCourseEnrollLoadinState());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('CoursesEnroll')
        .limit(10)
        .orderBy('creationDate')
        .snapshots().map((event) {
      event.docs.forEach((element) {
        print('Ahmessasedkasd');
        courseEnrollModel.add(CourseEnrollModel.fromMap(element.data()));
        print('sssssssssssssssssssd');
      });
      emit(GetCourseEnrollSuccessState());
      return courseEnrollModel;
    });
    //     .then((value) {
    //   value.docs.forEach((element) {
    //     print('Ahmessasedkasd');
    //     courseEnrollModel.add(CourseEnrollModel.fromMap(element.data()));
    //   });
    //
    // }).catchError((error) {
    //   emit(GetCourseEnrollErrorState(error.toString()));
    // });
  }
}
