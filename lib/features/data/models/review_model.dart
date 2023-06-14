class ReviewModel {
  String image;
  String name;
  int review;
  int timeSend;
  String text;

  ReviewModel({
    required this.image,
    required this.text,
    required this.name,
    required this.timeSend,
    required this.review,

  });
  Map<String, dynamic> toMap() => {
    'image': image,
    'text': text,
    'review': review,
    'timeSend': timeSend,
    'name': name,

  };

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      timeSend: map['timeSend'],
      name: map['name'],
      review: map['review'],
      text: map['text'],
      image: map['image'],

    );
  }
}