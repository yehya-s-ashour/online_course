import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String uId;
  final String status;
  final String profilePic;
  final String phoneNumber;
  final bool isOnline;
  List<String> groupId;
  final int lastSeen;
  Map<String,dynamic>? whoCanSee;
  bool archivedChats;
  bool isEnter;
  bool mediaVisibility;
  bool conversationTones;
  bool highMessage;
  bool highGroup;
  bool reactionMessage;
  bool reactionGroup;
  String isAbout;
  String isGroup;
  String isLastSeen;
  String isOnlineSeen;
  String isProfileSee;
  String isTimerMessage;
  String isStatus;
  String vibrateMessage;
  String vibrateGroup;
  String vibrateCall;
  String lightMessage;
  String lightGroup;
  String token;
  String fontType;
  String language;
  String theme;
  String wallpaper;
  List<String> userBlock;
  List<String> muteNotification;

  UserEntity(
      {required this.name,
        required this.uId,
        required this.status,
        required this.profilePic,
        required this.phoneNumber,
        required this.isOnline,
        required this.groupId,
        required this.lastSeen,
        required this.whoCanSee,
        required this.archivedChats,
        required this.isEnter,
        required this.mediaVisibility,
        required this.conversationTones,
        required this.highGroup,
        required this.highMessage,
        required this.reactionGroup,
        required this.reactionMessage,
        required this.isAbout,
        required this.isGroup,
        required this.isLastSeen,
        required this.isOnlineSeen,
        required this.isProfileSee,
        required this.isStatus,
        required this.vibrateMessage,
        required this.vibrateGroup,
        required this.vibrateCall,
        required this.lightMessage,
        required this.lightGroup,
        required this.token,
        required this.fontType,
        required this.language,
        required this.theme,
        required this.wallpaper,
        required this.userBlock,
        required this.muteNotification,
        required this.isTimerMessage});

  @override
  List<Object?> get props => [
    name,
    uId,
    status,
    profilePic,
    phoneNumber,
    isOnline,
    groupId,
    lastSeen,
    whoCanSee,
    archivedChats,
    isEnter,
    mediaVisibility,
    conversationTones,
    highMessage,
    highGroup,
    reactionMessage,
    reactionGroup,
    isAbout,
    isGroup,
    isLastSeen,
    isOnlineSeen,
    isProfileSee,
    isTimerMessage,
    isStatus,
    vibrateMessage,
    vibrateGroup,
    vibrateCall,
    lightMessage,
    lightGroup,
    token,
    fontType,
    theme,
    wallpaper,
    language,
    userBlock,
    muteNotification,
  ];
}