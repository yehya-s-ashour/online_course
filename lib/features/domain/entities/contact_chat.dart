class ContactChat {
  final String name;
  final String profilePic;
  final String couserId;
  final String lastMessage;
  final int timeSent;
  final String instractorName;

  ContactChat({
    required this.name,
    required this.profilePic,
    required this.couserId,
    required this.lastMessage,
    required this.instractorName,
    required this.timeSent,
  });

  @override
  List<Object?> get props => [
        name,
        profilePic,
        instractorName,
        couserId,
        lastMessage,
        timeSent,
      ];
}
