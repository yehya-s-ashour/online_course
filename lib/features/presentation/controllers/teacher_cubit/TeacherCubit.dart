import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/functions/time.dart';
import 'package:online_course/features/data/models/courses_model.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:uuid/uuid.dart';

import 'TecherState.dart';

class TeacherCubit extends Cubit<TecherState> {
  TeacherCubit() : super(RegisterInitialState());

  static TeacherCubit get(context) => BlocProvider.of(context);

  Future<void> createCourse({
    required String title,
    required String description,
    required File image,
    required String collection,
  }) async {
    String son = '';
    if (collection == 'Business') {
      son = 'Communication';
    } else if (collection == 'Development') {
      son = 'Data Science';
    } else if (collection == 'Marketing') {
      son = 'Digital Marketing';
    } else if (collection == 'Personal Development') {
      son = 'Creativity';
    } else {
      son = 'Math';
    }
    var courseId = const Uuid().v1();
    String fileUrl = '';
    fileUrl = await _storeFileToFirebase(
      'courses/${userEntity.uId}/$courseId',
      image,
    );

    FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection(collection)
        .doc('1')
        .collection(son)
        .doc(courseId)
        .set(CoursesModel(
            image: fileUrl,
            previewVideo: '',
            name: title,
            description: description,
            numberOfLessons: 0,
            rate: [],
            creationDate: '${getGlobalTimeLocal()},0',
            courseId: courseId,
            mainCategory: collection,
            subCategory: son,
            teacherName: userEntity.name,
            teacherId: userEntity.uId,
            lastLesson: '',
            students: []).toMap());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('Course')
        .doc(courseId)
        .set(CoursesModel(
            image: fileUrl,
            previewVideo: '',
            name: title,
            description: description,
            numberOfLessons: 0,
            rate: [],
            creationDate: '${getGlobalTimeLocal()},0',
            courseId: courseId,
            mainCategory: collection,
            subCategory: son,
            teacherName: userEntity.name,
            teacherId: userEntity.uId,
            lastLesson: '',
            students: []).toMap());
    print('wwwwwwww${userEntity.uId}');
  }

  Future<void> createLesson({
    required String title,
    required String description,
    required File image,
    required int index,
  }) async {
    var lessonId = const Uuid().v1();
    String fileUrl = '';
    fileUrl = await _storeFileToFirebase(
      'courses/${userEntity.uId}/${teacherCourseslist[index].courseId}/${teacherCourseslist[index].mainCategory}/${lessonId}',
      image,
    );

    FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection(teacherCourseslist[index].mainCategory)
        .doc('1')
        .collection(teacherCourseslist[index].subCategory)
        .doc(teacherCourseslist[index].courseId)
        .collection('Lessons')
        .doc(lessonId)
        .set(LessonModel(
                image: fileUrl,
                name: title,
                description: description,
                creationDate: '${getGlobalTimeLocal()},0',
                courseId: teacherCourseslist[index].courseId,
                teacherName: userEntity.name,
                teacherId: userEntity.uId,
                students: [],
                video: '',
                lessonId: lessonId)
            .toMap());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('Course')
        .doc(teacherCourseslist[index].courseId)
        .collection('Lessons')
        .doc(lessonId)
        .set(LessonModel(
                image: fileUrl,
                name: title,
                description: description,
                creationDate: '${getGlobalTimeLocal()},0',
                courseId: teacherCourseslist[index].courseId,
                teacherName: userEntity.name,
                teacherId: userEntity.uId,
                students: [],
                video: '',
                lessonId: lessonId)
            .toMap());
    print('wwwwwwww${userEntity.uId}');
  }

  Future<void> editCourse({
    required String title,
    required String description,
    required String image,
    required String newImage,
    required String courseId,
    required String mainCategory,
    required String subCategory,
  }) async {
    String fileUrl = '';
    if (newImage == '') {
      fileUrl = image;
    } else {
      fileUrl = await _storeFileToFirebase(
        'courses/${userEntity.uId}/$courseId',
        File(newImage),
      );
    }

    FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection(mainCategory)
        .doc('1')
        .collection(subCategory)
        .doc(courseId)
        .update({'image': fileUrl, 'name': title, 'description': description});
    FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('Course')
        .doc(courseId)
        .update({'image': fileUrl, 'name': title, 'description': description});
    print('wwwwwwww${userEntity.uId}');
  }

  Future<void> editLesson({
    required String title,
    required String description,
    required String image,
    required String newImage,
    required String courseId,
    required String lessonId,
    required String mainCategory,
    required String subCategory,
  }) async {
    String fileUrl = '';
    if (newImage == '') {
      fileUrl = image;
    } else {
      fileUrl = await _storeFileToFirebase(
        'courses/${userEntity.uId}/$courseId',
        File(newImage),
      );
    }
print('ssssssssssss$lessonId');
    FirebaseFirestore.instance
        .collection('Categories')
        .doc('1')
        .collection(mainCategory)
        .doc('1')
        .collection(subCategory)
        .doc(courseId)
        .collection('Lessons')
        .doc(lessonId)
        .update({'image': fileUrl, 'name': title, 'description': description});
    FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('Course')
        .doc(courseId)
        .collection('Lessons')
        .doc(lessonId)
        .update({'image': fileUrl, 'name': title, 'description': description});
    print('wwwwwwww${userEntity.uId}');
  }

  Future<String> _storeFileToFirebase(String path, File file) async {
    UploadTask uploadTask =
        FirebaseStorage.instance.ref().child(path).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Stream<List<CoursesModel>> getCourses() {
    emit(GetCoursesLoadinState());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('Course')
        .snapshots()
        .map((event) {
      teacherCourseslist = [];
      event.docs.forEach((element) {
        teacherCourseslist.add(CoursesModel.fromMap(element.data()));
      });
      emit(GetCoursesSuccessState());
      return teacherCourseslist;
    });
  }

  Stream<List<LessonModel>> getLessons({required int index}) {
    List<LessonModel> teacherLessonlist = [];
    emit(GetLessonsLoadinState());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('Course')
        .doc(teacherCourseslist[index].courseId)
        .collection('Lessons')
        .snapshots()
        .map((event) {
      teacherLessonlist = [];
      event.docs.forEach((element) {
        teacherLessonlist.add(LessonModel.fromMap(element.data()));
      });
      emit(GetLessonsSuccessState());
      return teacherLessonlist;
    });
  }
}
