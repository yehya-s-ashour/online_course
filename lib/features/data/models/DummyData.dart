class Course {
  String image;
  String previewVideo;
  String name;
  String description;
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
    required this.description,
    required this.numberOfLessons,
    required this.rate,
    required this.creationDate,
    required this.courseId,
    required this.teacherName,
    required this.lastCourse,
    required this.students,
  });
}

List<Course> coursesList = [
  Course(
    name: 'Foundation of web Development',
    image: 'assets/images/image.jpg',
    previewVideo: '',
    description: '',
    numberOfLessons: 55,
    rate: [],
    creationDate: DateTime.now(),
    courseId: '',
    teacherName: '',
    lastCourse: '',
    students: [],
  ),
  Course(
    name: 'Foundation of web Development',
    image: 'assets/images/image.jpg',
    previewVideo: '',
    description: '',
    numberOfLessons: 55,
    rate: [],
    creationDate: DateTime.now(),
    courseId: '',
    teacherName: '',
    lastCourse: '',
    students: [],
  ),
  Course(
    name: 'Foundation of web Development',
    image: 'assets/images/image.jpg',
    previewVideo: '',
    description: '',
    numberOfLessons: 55,
    rate: [],
    creationDate: DateTime.now(),
    courseId: '',
    teacherName: '',
    lastCourse: '',
    students: [],
  ),
  Course(
    name: 'Foundation of web Development',
    image: 'assets/images/image.jpg',
    previewVideo: '',
    description: '',
    numberOfLessons: 55,
    rate: [],
    creationDate: DateTime.now(),
    courseId: '',
    teacherName: '',
    lastCourse: '',
    students: [],
  ),
];

class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Development',
    noOfCourses: 55,
    thumbnail: 'assets/images/image.jpg',
  ),
  Category(
    name: 'Development',
    noOfCourses: 55,
    thumbnail: 'assets/images/image.jpg',
  ),
  Category(
    name: 'Development',
    noOfCourses: 55,
    thumbnail: 'assets/images/image.jpg',
  ),
  Category(
    name: 'Development',
    noOfCourses: 55,
    thumbnail: 'assets/images/image.jpg',
  ),
  Category(
    name: 'Development',
    noOfCourses: 55,
    thumbnail: 'assets/images/image.jpg',
  ),
];
