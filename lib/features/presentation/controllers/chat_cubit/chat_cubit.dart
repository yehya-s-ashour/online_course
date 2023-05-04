import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/features/data/models/message_group_model.dart';

import '../../../../core/enums/messge_type.dart';
import '../../../../core/shared/message_replay.dart';
import '../../../domain/entities/contact_chat.dart';
import '../../../domain/entities/message.dart';


part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {


  // final GetContactNameUseCase _getContactNameUseCase;

  ChatCubit(

  ) : super(ChatInitial());

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
        .collection('groups')
        .doc(receiverId)
        .collection('chats')
        .orderBy('timeSent')
        .snapshots()
        .map((event) {
          List<MessageModel> messages = [];
          for (var document in event.docs) {
            messages.add(MessageModel.fromMap(document.data()));
          }
          return messages;
        });
  }
}
