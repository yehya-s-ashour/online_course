class LessonModel {
  String image;
  String video;
  String name;
  String description;
  DateTime creationDate;
  String mainCategory;
  String subCategory;
  String lessonId;
  String courseId;
  String teacherName;
  String teacherId;
  List<String> students;

  LessonModel({
    required this.image,
    required this.video,
    required this.name,
    required this.description,
    required this.mainCategory,
    required this.subCategory,
    required this.creationDate,
    required this.lessonId,
    required this.courseId,
    required this.teacherName,
    required this.teacherId,
    required this.students,
  });

  Map<String, dynamic> toMap() => {
        'image': image,
        'video': video,
        'name': name,
        'description': description,
        'creationDate': creationDate.millisecondsSinceEpoch,
        'lessonId': lessonId,
        'courseId': courseId,
        'teacherName': teacherName,
        'teacherId': teacherId,
        'students': students,
      };
}
