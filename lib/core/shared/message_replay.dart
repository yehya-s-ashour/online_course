import '/core/enums/messge_type.dart';

class MessageReplay {
  final String message;
  final bool isMe;
  final MessageType messageType;
  final String repliedTo;
  final String repliedToUid;

  const MessageReplay({
    required this.message,
    required this.isMe,
    required this.messageType,
    required this.repliedTo,
    required this.repliedToUid,
  });

  @override
  List<Object?> get props => [
        message,
        isMe,
        messageType,
        repliedTo,
      ];
}
