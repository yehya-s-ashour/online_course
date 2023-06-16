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

class RecentSearch {
  String image;
  String name;

  RecentSearch({
    required this.image,
    required this.name,
  });
}

List<RecentSearch> searchList = [
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
  RecentSearch(
    name: 'Development',
    image: 'assets/images/image.jpg',
  ),
];

class Notifications {
  String image;
  String description;

  Notifications({
    required this.image,
    required this.description,
  });
}

List<Notifications> notificationList = [
  Notifications(
    description: 'You\'re Welcome To Be Here in Learnify App',
    image:
        'https://firebasestorage.googleapis.com/v0/b/ilearn-app-1181f.appspot.com/o/ic_launcher.png?alt=media&token=03f8aedc-a133-4a50-a36c-f70b8bd2e25e',
  ),
  Notifications(
    description: 'You\'ve Been Successfully Enrolled In Course......',
    image:
        'https://firebasestorage.googleapis.com/v0/b/ilearn-app-1181f.appspot.com/o/Business%2FCommunications%2FPublic%20Speaking%3A%20You%20Can%20be%20a%20Great%20Speaker%20within%2024%20Hours%2F773414_54e6_4.jpg?alt=media&token=e03042aa-f75c-407d-a69c-cf0981f93dac',
  ),
];
