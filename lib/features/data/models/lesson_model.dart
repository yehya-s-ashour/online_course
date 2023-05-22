import 'package:online_course/features/domain/entities/lesson.dart';

class LessonModel extends Lesson {
  LessonModel({
    required super.image,
    required super.video,
    required super.name,
    required super.description,

    required super.creationDate,
    required super.lessonId,
    required super.courseId,
    required super.teacherName,
    required super.teacherId,
    required super.students,
  });

  Map<String, dynamic> toMap() => {
        'image': image,
        'video': video,
        'name': name,
        'description': description,
        'creationDate': creationDate,
        'lessonId': lessonId,
        'courseId': courseId,
        'teacherName': teacherName,
        'teacherId': teacherId,
        'students': students,
      };

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      video: map['video'],
      lessonId: map['lessonId'],
      image: map['image'],
      name: map['name'],
      description: map['description'],
      creationDate: map['creationDate'],
      courseId: map['courseId'],
      teacherName: map['teacherName'],
      teacherId: map['teacherId'],
      students: List<String>.from(map['students']),
    );
  }
}
