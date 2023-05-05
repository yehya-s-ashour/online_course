class Roadmap {
  late String name1;
  late String name2;
  late String name3;
  late String name4;
  late String name5;

  Roadmap(
      {required this.name1,
        required this.name2,
        required this.name3,
        required this.name4,
        required this.name5,});

  @override
  List<Object?> get props => [
    name1,
    name2,
    name3,
    name4,
    name5,
  ];
}