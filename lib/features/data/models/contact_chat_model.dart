import 'package:online_course/features/domain/entities/contact_chat.dart';

class ContactChatModel extends ContactChat {
  ContactChatModel({
    required super.name,
    required super.instractorName,
    required super.profilePic,
    required super.couserId,
    required super.lastMessage,
    required super.timeSent,
  });

  Map<String, dynamic> toMAp() => {
        'name': name,
        'profilePic': profilePic,
        'couserId': couserId,
        'lastMessage': lastMessage,
        'timeSent': timeSent,
        'instractorName': instractorName,
      };

  factory ContactChatModel.fromMap(Map<String, dynamic> map) =>
      ContactChatModel(
        name: map['name'],
        profilePic: map['profilePic'],
        couserId: map['couserId'],
        instractorName: map['instractorName'],
        lastMessage: map['lastMessage'],
        timeSent: map['timeSent'],
      );
}
