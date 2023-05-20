import 'package:online_course/core/functions/time.dart';
import 'package:online_course/features/domain/entities/courseEnroll.dart';

class CourseEnrollModel extends CourseEnroll {
  CourseEnrollModel({
    required super.image,
    required super.name,
    required super.previewVideo,
    required super.description,
    required super.numberOfLessons,
    required super.creationDate,
    required super.courseId,
    required super.mainCategory,
    required super.subCategory,
    required super.lessonsSeen,
  });

  factory CourseEnrollModel.fromMap(Map<String, dynamic> map) {
    return CourseEnrollModel(
      image: map['image'],
      previewVideo: map['previewVideo'],
      name: map['name'],
      description: map['description'],
      numberOfLessons: map['numberOfLessons'],
      creationDate: map['creationDate'],
      courseId: map['courseId'],
      mainCategory: map['mainCategory'],
      subCategory: map['subCategory'],
      lessonsSeen: List<String>.from(map['lessonsSeen']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'previewVideo': previewVideo,
      'description': description,
      'numberOfLessons': numberOfLessons,
      'creationDate': getGlobalTimeLocal(),
      'courseId': courseId,
      'mainCategory': mainCategory,
      'subCategory': subCategory,
      'lessonsSeen': lessonsSeen,
    };
  }
}
