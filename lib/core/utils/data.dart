import 'package:online_course/core/generated/assets.dart';

class Department1 {
  final String name;
  final String image;
  final List<Course1> courses;

  Department1({
    required this.name,
    required this.image,
    required this.courses,
  });

  static List<Department1> departments = [
    Department1(
      name: 'Front End',
      image: Assets.assetsImagesFrontend,
      courses: [
        Course1(
          name: 'HTML',
          image: Assets.imagesHtml,
          description: 'Learn the basics of HTML',
        ),
        Course1(
          name: 'CSS',
          image: Assets.imagesCss,
          description: 'Learn the basics of CSS',
        ),
        Course1(
          name: 'JavaScript',
          image: Assets.imagesJavascript,
          description: 'Learn the basics of JavaScript',
        ),
        Course1(
          name: 'React',
          image: Assets.imagesReact,
          description: 'Learn the basics of React',
        ),
        Course1(
          name: 'Angular',
          image: Assets.imagesAngular,
          description: 'Learn the basics of Angular',
        ),
      ],
    ),
    Department1(
      name: 'Back End',
      image: Assets.imagesBackend,
      courses: [
        Course1(
          name: 'Node.js',
          image: Assets.imagesNodeJs,
          description: 'Learn the basics of Node.js',
        ),
        Course1(
          name: 'Express.js',
          image: Assets.imagesExpressesJs,
          description: 'Learn the basics of Express.js',
        ),
        Course1(
          name: 'PHP',
          image: Assets.imagesPHP,
          description: 'Learn the basics of PHP',
        ),
        Course1(
          name: 'Ruby on Rails',
          image: Assets.imagesRubyOnRails,
          description: 'Learn the basics of Ruby on Rails',
        ),
        Course1(
          name: 'Django',
          image: Assets.imagesDjango,
          description: 'Learn the basics of Django',
        ),
      ],
    ),
    Department1(
      name: 'Flutter',
      image: Assets.imagesFlutter,
      courses: [
        Course1(
          name: 'Introduction to Flutter',
          image: Assets.imagesFlutter,
          description: 'Learn the basics of Flutter',
        ),
        Course1(
          name: 'Flutter Widgets',
          image: Assets.imagesFlutter,
          description: 'Learn about the different widgets in Flutter',
        ),
        Course1(
          name: 'Flutter Layouts',
          image: Assets.imagesFlutter,
          description: 'Learn about layouts in Flutter',
        ),
        Course1(
          name: 'Flutter Animation',
          image: Assets.imagesFlutter,
          description: 'Learn about animation in Flutter',
        ),
        Course1(
          name: 'Flutter Networking',
          image: Assets.imagesFlutter,
          description: 'Learn about networking in Flutter',
        ),
      ],
    ),
    Department1(
      name: 'Python',
      image: Assets.imagesPathon,
      courses: [
        Course1(
          name: 'Python Basics',
          image: Assets.imagesPathonchild,
          description: 'Learn the basics of Python',
        ),
        Course1(
          name: 'Python Functions',
          image: Assets.imagesPathonchild,
          description: 'Learn about functions in Python',
        ),
        Course1(
          name: 'Python Data Structures',
          image: Assets.imagesPathonchild,
          description: 'Learn about common data structures in Python',
        ),
        Course1(
          name: 'Python Object-Oriented Programming',
          image: Assets.imagesPathonchild,
          description: 'Learn about object-oriented programming in Python',
        ),
        Course1(
          name: 'Python Web Scraping',
          image: Assets.imagesPathonchild,
          description: 'Learn how to scrape data from the web using Python',
        ),
      ],
    ),
  ];
}

class Course1 {
  final String name;
  final String image;

  final String description;

  Course1({
    required this.name,
    required this.image,
    required this.description,
  });
}

List<Course1> recommends = [
  Course1(
    name: 'Python Web Scraping',
    image: Assets.imagesPathonchild,
    description: 'Learn how to scrape data from the web using Python',
  ),
  Course1(
    name: 'Flutter Networking',
    image: Assets.imagesFlutter,
    description: 'Learn about networking in Flutter',
  ),
  Course1(
    name: 'Introduction to Flutter',
    image: Assets.imagesFlutter,
    description: 'Learn the basics of Flutter',
  ),
  Course1(
    name: 'Django',
    image: Assets.imagesDjango,
    description: 'Learn the basics of Django',
  ),
];
