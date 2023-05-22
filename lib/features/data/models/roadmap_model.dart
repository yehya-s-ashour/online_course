import 'package:online_course/features/domain/entities/roadmap.dart';

class RoadmapModel extends Roadmap {
  RoadmapModel({
    required super.name1,
    required super.name2,
    required super.name3,
    required super.name4,
    required super.name5,
    required super.image1,
    required super.image2,
    required super.image3,
    required super.image4,
    required super.image5,
    required super.description1,
    required super.description2,
    required super.description3,
    required super.description4,
    required super.description5,
  });

  Map<String, dynamic> toMap() => {
    'name1': name1,
    'name2': name2,
    'name3': name3,
    'name4': name4,
    'name5': name5,
    'image1': image1,
    'image2': image2,
    'image3': image3,
    'image4': image4,
    'image5': image5,
    'description1': description1,
    'description2': description2,
    'description3': description3,
    'description4': description4,
    'description5': description5,
  };

  factory RoadmapModel.fromMap(Map<String, dynamic> map) =>
      RoadmapModel(
        name1: map['name1'],
        name2: map['name2'],
        name3: map['name3'],
        name4: map['name4'],
        name5: map['name5'] ,
        image1: map['image1'],
        image2: map['image2'],
        image3: map['image3'],
        image4: map['image4'],
        image5: map['image5'] ,
        description1: map['description1'],
        description2: map['description2'],
        description3: map['description3'],
        description4: map['description4'],
        description5: map['description5'] ,
      );
}
