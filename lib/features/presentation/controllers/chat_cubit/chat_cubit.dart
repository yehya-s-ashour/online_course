import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/functions/time.dart';
import 'package:online_course/features/data/models/contact_chat_model.dart';
import 'package:online_course/features/data/models/message_group_model.dart';
import 'package:online_course/features/data/models/review_model.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/enums/messge_type.dart';
import '../../../../core/shared/message_replay.dart';
import '../../../domain/entities/contact_chat.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  // final GetContactNameUseCase _getContactNameUseCase;

  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  MessageReplay? messageReplay;
  bool reactionView = false;

  String currentIndex = '';
  String messageText = '';
  String sendText = '';
  MessageType? typeMessage;

  void changeStateReaction(
      String value, String message, MessageType typeMessage, String sendText) {
    emit(LoadingChangeReactionState());
    currentIndex = value;
    this.sendText = sendText;
    this.typeMessage = typeMessage;
    messageText = message;
    reactionView = true;
    emit(SuccessChangeReactionState());
  }

  void changeReaction() {
    emit(LoadingChangeReactionState());
    reactionView = false;
    emit(SuccessChangeReactionState());
  }

  bool isDelete = false;

  void changeDeleteFrom() {
    emit(LoadingChangeDeleteState());
    isDelete = !isDelete;
    emit(SuccessChangeDeleteState());
  }

  void changeDeletesFrom() {
    emit(LoadingChangeDeleteState());
    isDelete = false;
    emit(SuccessChangeDeleteState());
  }

  void changeDeletesFrom2() {
    emit(LoadingChangeDelete2State());
    isDelete = false;
    emit(SuccessChangeDelete2State());
  }

  void onMessageSwipe({
    required String message,
    required bool isMe,
    required MessageType messageType,
    required String repliedTo,
    required String repliedToUid,
  }) {
    emit(MessageSwipeLoadingState());
    messageReplay = MessageReplay(
        message: message,
        isMe: isMe,
        messageType: messageType,
        repliedTo: repliedTo,
        repliedToUid: repliedToUid);
    emit(MessageSwipeState());
  }

  void cancelReplay() {
    messageReplay = null;
    emit(CancelReplayState());
  }

  List<ContactChat> contactSearch = [];

  bool isSearch = false;

  void changeSearchState() {
    emit(LoadingChangeSearchState());
    isSearch = !isSearch;
    emit(SuccessChangeSearchState());
  }

  //////////////////////////////////////////////////////////////
  Stream<List<MessageModel>> getChatMessagesGroup(
      {required String receiverId}) {
    return FirebaseFirestore.instance
        .collection('chat')
        .doc(receiverId)
        .collection('chat')
        .orderBy('timeSent',descending: true)
        .snapshots()
        .map((event) {
      List<MessageModel> messages = [];
      for (var document in event.docs) {
        messages.add(MessageModel.fromMap(document.data()));
      }
      return messages;
    });
  }

  List<ContactChatModel> contactChatModel = [];

  Future<void> setContactChat({required Course coursesModel}) async {
    String encoded = stringToBase64Url.encode(
      'Joined',
    );
    String sh =
        "${encoded.characters.last}$encoded${encoded.replaceAll('${encoded.characters.first}', 'w').replaceAll(encoded.characters.last, 'i')}";

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('chat')
        .doc(coursesModel.courseId)
        .set(ContactChatModel(
                name: coursesModel.name,
                instractorName: 'Ahmed',
                profilePic: coursesModel.image,
                couserId: coursesModel.courseId,
                lastMessage: sh,
                timeSent: getGlobalTimeLocal())
            .toMAp())
        .then((value) {
      emit(SetContactChatSuccessState());
    }).catchError((error) {
      emit(SetContactChatErrorState());
    });
  }

  Stream<List<ContactChatModel>> getContactChat() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userEntity.uId)
        .collection('chat')
        .orderBy('timeSent', descending: true)
        .snapshots()
        .map((event) {
      emit(GetContactChatSuccessState());
      contactChatModel = [];
      event.docs.forEach((element) {
        contactChatModel.add(ContactChatModel.fromMap(element.data()));
      });
      emit(GetContactChatSuccessState());
      return contactChatModel;
    });
  }

  List<ReviewModel> reviewModel = [];

  Stream<List<ReviewModel>> getReview() {
    return FirebaseFirestore.instance
        .collection('review')
        .doc(id)
        .collection('reviews')
        .snapshots()
        .map((event) {
      emit(GetContactChatSuccessState());
      reviewModel = [];
      event.docs.forEach((element) {
        reviewModel.add(ReviewModel.fromMap(element.data()));
      });
      emit(GetContactChatSuccessState());
      return reviewModel;
    });
  }

  Future<void> sendReview(String text, int review) async {
    await FirebaseFirestore.instance
        .collection('review')
        .doc(id)
        .collection('reviews')
        .add(
          ReviewModel(
                  image: userEntity.profilePic,
                  text: text,
                  name: userEntity.name,
                  timeSend: getGlobalTimeLocal(),
                  review: review)
              .toMap(),
        );
  }

  Future<void> sendMessgeText(String coursesid, String text) async {
    var messageId = const Uuid().v1();
    String encoded = stringToBase64Url.encode(
      text,
    );
    String sh =
        "${encoded.characters.last}$encoded${encoded.replaceAll('${encoded.characters.first}', 'w').replaceAll(encoded.characters.last, 'i')}";
    await FirebaseFirestore.instance
        .collection('chat')
        .doc(coursesid)
        .collection('chat').doc(messageId)
        .set(
          MessageModel(
                  senderId: userEntity.uId,
                  senderPic: userEntity.profilePic,
                  text: sh,
                  messageId: messageId,
                  timeSent: getGlobalTimeLocal(),
                  isSeen: [],
                  messageType: MessageType.text,
                  repliedMessage: '',
                  repliedTo: '',
                  repliedToUid: '',
                  repliedMessageType: MessageType.text,
                  senderName: userEntity.name,
                  reaction: {})
              .toMap(),
        );
  }


}
