class Department1 {
  final String name;
  final String image;
  final List<Course1> courses;

  Department1({
    required this.name,
    required this.image,
    required this.courses,
  });
}

class Course1 {
  final String name;
  final String image;

  final String? description;

  Course1({
    required this.name,
    required this.image,
    this.description,
  });
}
