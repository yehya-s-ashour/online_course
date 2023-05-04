

class ContactChat  {
  final String name;
  final String profilePic;
  final String couserId;
  final String lastMessage;
  final String timeSent;
  final String instractorName;
  bool muteNotification;

  ContactChat({
    required this.name,
    required this.profilePic,
    required this.couserId,
    required this.lastMessage,
    required this.instractorName,
    required this.timeSent,

    required this.muteNotification,
  });

  @override
  List<Object?> get props => [
        name,
        profilePic,
    instractorName,
    couserId,
        lastMessage,
        timeSent,
    muteNotification,
      ];
}
