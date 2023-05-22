class CourseEnroll {
  String image;
  String name;
  String description;
  int numberOfLessons;
  int creationDate;
  String courseId;
  String previewVideo;
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
    required this.previewVideo,
    required this.mainCategory,
    required this.subCategory,
    required this.lessonsSeen,
  });
}