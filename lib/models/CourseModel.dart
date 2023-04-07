class CourseModel {
  String image;
  String previewVideo;
  String name;
  String description;
  int numberOfLessons;
  List<double> rate;
  DateTime creationDate;
  String courseId;
  String teacherName;
  String teacherId;
  String mainCategory;
  String subCategory;
  String lastLesson;
  List<String> students;

  CourseModel({
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

  Map<String, dynamic> toMap() => {
        'image': image,
        'previewVideo': previewVideo,
        'name': name,
        'description': description,
        'numberOfLessons': numberOfLessons,
        'rate': rate,
        'creationDate': creationDate.millisecondsSinceEpoch,
        'mainCategory': mainCategory,
        'subCategory': subCategory,
        'courseId': courseId,
        'teacherName': teacherName,
        'teacherId': teacherId,
        'lastLesson': lastLesson,
        'students': students,
      };
}
