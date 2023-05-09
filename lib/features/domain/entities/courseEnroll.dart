class CourseEnroll {
  String image;
  String name;
  int description;
  int numberOfLessons;
  String creationDate;
  String courseId;
  String mainCategory;
  String subCategory;
  List<String> lessonsSeen;

  CourseEnroll({
    required this.image,
    required this.name,
    required this.description,
    required this.numberOfLessons,
    required this.creationDate,
    required this.courseId,
    required this.mainCategory,
    required this.subCategory,
    required this.lessonsSeen,
  });
}