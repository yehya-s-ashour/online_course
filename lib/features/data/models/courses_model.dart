import 'package:online_course/features/domain/entities/courses.dart';

class CoursesModel extends Course {
  CoursesModel({
    required super.image,
    required super.previewVideo,
    required super.name,
    required super.description,
    required super.numberOfLessons,
    required super.rate,
    required super.creationDate,
    required super.courseId,
    required super.mainCategory,
    required super.subCategory,
    required super.teacherName,
    required super.teacherId,
    required super.lastLesson,
    required super.students,
  });

  factory CoursesModel.fromMap(Map<String, dynamic> map) {
    return CoursesModel(
      image: map['image'],
      previewVideo: map['previewVideo'],
      name: map['name'],
      description: map['description'],
      numberOfLessons: map['numberOfLessons'],
      rate: List<int>.from(map['rate']),
      creationDate: map['creationDate'],
      courseId: map['courseId'],
      mainCategory: map['mainCategory'],
      subCategory: map['subCategory'],
      teacherName: map['teacherName'],
      teacherId: map['teacherId'],
      lastLesson: map['lastLesson'],
      students: List<String>.from(map['students']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'previewVideo': previewVideo,
      'name': name,
      'description': description,
      'numberOfLessons': numberOfLessons,
      'rate': rate,
      'creationDate': creationDate,
      'courseId': courseId,
      'mainCategory': mainCategory,
      'subCategory': subCategory,
      'teacherName': teacherName,
      'teacherId': teacherId,
      'lastLesson': lastLesson,
      'students': students,
    };
  }
}
