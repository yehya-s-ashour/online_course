class Lesson {
  String image;
  String previewVideo;
  String name;
  String Description;
  int numberOfLessons;
  List<double> rate;
  DateTime creationDate;
  String courseId;
  String teacherName;
  String lastLesson;
  List<String> students;

  Lesson({
    required this.image,
    required this.previewVideo,
    required this.name,
    required this.Description,
    required this.numberOfLessons,
    required this.rate,
    required this.creationDate,
    required this.courseId,
    required this.teacherName,
    required this.lastLesson,
    required this.students,
  });
}

List<Lesson> LessonsList = [
  Lesson(
    name: 'Development',
    numberOfLessons: 55,
    image: 'assets/icons/laptop.jpg',
  ),
  Lesson(
    name: 'Accounting',
    numberOfLessons: 20,
    image: 'assets/icons/accounting.jpg',
  ),
  Lesson(
    name: 'Photography',
    numberOfLessons: 16,
    image: 'assets/icons/photography.jpg',
  ),
  Lesson(
    name: 'Product Design',
    numberOfLessons: 25,
    image: 'assets/icons/design.jpg',
  ),
];
