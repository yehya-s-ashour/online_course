import 'package:online_course/core/enums/messge_type.dart';
import 'package:online_course/features/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel({
    required super.senderId,
    required super.senderPic,
    required super.text,
    required super.messageId,
    required super.timeSent,
    required super.isSeen,
    required super.messageType,
    required super.repliedMessage,
    required super.repliedTo,
    required super.repliedToUid,
    required super.repliedMessageType,
    required super.senderName,
    required super.reaction,
  });

  Map<String, dynamic> toMap() => {
        'senderId': senderId,
        'text': text,
        'senderPic': senderPic,
        'messageId': messageId,
        'timeSent': timeSent,
        'isSeen': isSeen,
        'messageType': messageType.type,
        'repliedMessage': repliedMessage,
        'repliedTo': repliedTo,
        'repliedToUid': repliedToUid,
        'repliedMessageType': repliedMessageType.type,
        'senderName': senderName,
        'reaction': reaction,
      };

  factory MessageModel.fromMap(Map<String, dynamic> map) => MessageModel(
        senderId: map['senderId'],
        senderPic: map['senderPic'],
        text: map['text'],
        messageId: map['messageId'],
        timeSent: map['timeSent'],
        isSeen: List<String>.from(map['isSeen']),
        messageType: (map['messageType'] as String).toEnum(),
        repliedMessage: map['repliedMessage'],
        repliedTo: map['repliedTo'],
        repliedToUid: map['repliedToUid'],
        reaction: Map<String, dynamic>.from(map['reaction']),
        repliedMessageType: (map['repliedMessageType'] as String).toEnum(),
        senderName: map['senderName'],
      );
}
