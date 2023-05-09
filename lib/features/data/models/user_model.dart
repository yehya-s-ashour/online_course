import 'package:online_course/features/domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.bio,
    required super.profilePic,
    required super.token,
    required super.language,
    required super.theme,
    required super.wallpaper,
    required super.name,
    required super.uId,
    required super.email,
    required super.courseEnroll,
    required super.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      uId: json['uId'],
      bio: json['bio'],
      profilePic: json['profilePic'],
      token: json['token'],
      language: json['language'],
      theme: json['theme'],
      courseEnroll: List<String>.from(json['courseEnroll']),
      wallpaper: json['wallpaper'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'uId': uId,
      'bio': bio,
      'profilePic': profilePic,
      'token': token,
      'courseEnroll': courseEnroll,
      'language': language,
      'theme': theme,
      'wallpaper': wallpaper,
    };
  }
}
