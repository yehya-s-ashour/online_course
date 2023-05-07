class Roadmap {
  late String name1;
  late String name2;
  late String name3;
  late String name4;
  late String name5;
  late String image1;
  late String image2;
  late String image3;
  late String image4;
  late String image5;

  Roadmap(
      {required this.name1,
        required this.name2,
        required this.name3,
        required this.name4,
        required this.name5,
        required this.image1,
        required this.image2,
        required this.image3,
        required this.image4,
        required this.image5,});

  @override
  List<Object?> get props => [
    name1,
    name2,
    name3,
    name4,
    name5,
    image1,
    image2,
    image3,
    image4,
    image5,
  ];
}