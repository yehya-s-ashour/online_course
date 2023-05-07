class Lesson {
  String image;
  String video;
  String name;
  String description;
  String creationDate;
  String lessonId;
  String courseId;
  String teacherName;
  String teacherId;
  List<String> students;

  Lesson({
    required this.image,
    required this.video,
    required this.name,
    required this.description,
    required this.creationDate,
    required this.lessonId,
    required this.courseId,
    required this.teacherName,
    required this.teacherId,
    required this.students,
  });
}