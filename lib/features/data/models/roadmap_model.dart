import 'package:online_course/features/domain/entities/roadmap.dart';

class RoadmapModel extends Roadmap {
  RoadmapModel({
    required super.name1,
    required super.name2,
    required super.name3,
    required super.name4,
    required super.name5,
  });

  Map<String, dynamic> toMap() => {
    'name1': name1,
    'name2': name2,
    'name3': name3,
    'name4': name4,
    'name5': name5,
  };

  factory RoadmapModel.fromMap(Map<String, dynamic> map) =>
      RoadmapModel(
        name1: map['name1'],
        name2: map['name2'],
        name3: map['name3'],
        name4: map['name4'],
        name5: map['name5'] ,
      );
}
