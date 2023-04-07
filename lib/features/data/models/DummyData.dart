class Course {
  String image;
  String previewVideo;
  String name;
  String Description;
  int numberOfLessons;
  List<double> rate;
  DateTime creationDate;
  String courseId;
  String teacherName;
  String lastCourse;
  List<String> students;

  Course({
    required this.image,
    required this.previewVideo,
    required this.name,
    required this.Description,
    required this.numberOfLessons,
    required this.rate,
    required this.creationDate,
    required this.courseId,
    required this.teacherName,
    required this.lastCourse,
    required this.students,
  });
}

List<Course> CoursesList = [
  Course(
    name: 'Development',
    noOfCourses: 55,
    thumbnail: 'assets/icons/laptop.jpg',
  ),
];
