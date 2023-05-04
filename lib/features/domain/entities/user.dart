class UserEntity {
  late String name;
  late String email;
  late String password;
  late String uId;
  late String bio;
  late String profilePic;
  late String token;
  late String language;
  late String theme;
  late String wallpaper;

  UserEntity(
      {required this.name,
        required this.uId,
        required this.bio,
        required this.profilePic,
        required this.email,
        required this.password,
        required this.token,
        required this.language,
        required this.theme,
        required this.wallpaper,});

  @override
  List<Object?> get props => [
    name,
    uId,
    bio,
    profilePic,
    password,
    token,
    email,
    theme,
    wallpaper,
    language,
  ];

  UserEntity.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    uId = json['uId'];
    bio = json['bio'];
    profilePic = json['profilePic'];
    token = json['token'];
    language = json['language'];
    theme = json['theme'];
    wallpaper = json['wallpaper'];
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
      'language': language,
      'theme': theme,
      'wallpaper': wallpaper,
    };
  }
}