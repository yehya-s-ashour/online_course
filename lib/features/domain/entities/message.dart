import 'package:online_course/core/enums/messge_type.dart';

class Message  {
  final String senderId;
  final String senderName;
  final String senderPic;
  final String text;
  final String messageId;
  final int timeSent;
  final List<String> isSeen;
  final MessageType messageType;
  //replay message
  final String repliedMessage;
  final String repliedTo;
  final String repliedToUid;
  final MessageType repliedMessageType;
  Map<String, dynamic>? reaction;
  Message({
    required this.senderId,
    required this.senderPic,
    required this.text,
    required this.messageId,
    required this.timeSent,
    required this.isSeen,
    required this.messageType,
    required this.repliedMessage,
    required this.repliedTo,
    required this.repliedToUid,
    required this.repliedMessageType,
    required this.senderName,
    this.reaction,
  });

  @override
  List<Object?> get props => [
    senderId,
    text,
    senderPic,
    messageId,
    timeSent,
    isSeen,
    messageType,
    repliedMessage,
    repliedTo,
    repliedToUid,
    repliedMessageType,
    senderName,
    reaction,
  ];
}
