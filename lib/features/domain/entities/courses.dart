class Course {
  String image;
  String previewVideo;
  String name;
  String description;
  int numberOfLessons;
  List<int> rate;
  String creationDate;
  String courseId;
  String teacherName;
  String teacherId;
  String mainCategory;
  String subCategory;
  String lastLesson;
  List<String> students;

  Course({
    required this.image,
    required this.previewVideo,
    required this.name,
    required this.description,
    required this.numberOfLessons,
    required this.rate,
    required this.creationDate,
    required this.courseId,
    required this.mainCategory,
    required this.subCategory,
    required this.teacherName,
    required this.teacherId,
    required this.lastLesson,
    required this.students,
  });
}
