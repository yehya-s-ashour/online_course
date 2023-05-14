part of 'chat_cubit.dart';

abstract class ChatState  {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

class SendMessageLoadingState extends ChatState{
  @override
  List<Object?> get props => [];
}

class SendMessageSuccessState extends ChatState{
  @override
  List<Object?> get props => [];
}

class SendReactionSuccessState extends ChatState{
  @override
  List<Object?> get props => [];
}

class SendReactionLoadingState extends ChatState{
  @override
  List<Object?> get props => [];
}

class SendReactionErrorState extends ChatState{
  @override
  List<Object?> get props => [];
}

class SendMessageErrorState extends ChatState{
  @override
  List<Object?> get props => [];
}

class GetContactNameErrorState extends ChatState{
  @override
  List<Object?> get props => [];
}
class GetContactNameSuccessState extends ChatState{
  @override
  List<Object?> get props => [];
}

//message swipe
class MessageSwipeLoadingState extends ChatState{
  @override
  List<Object?> get props => [];
}
class MessageSwipeState extends ChatState{
  @override
  List<Object?> get props => [];
}

class CancelReplayState extends ChatState{
  @override
  List<Object?> get props => [];
}


class LoadingChangeReactionState extends ChatState{
  @override
  List<Object?> get props => [];
}
class SuccessChangeReactionState extends ChatState{
  @override
  List<Object?> get props => [];
}

class LoadingChangeDeleteState extends ChatState{
  @override
  List<Object?> get props => [];
}
class SuccessChangeDeleteState extends ChatState{
  @override
  List<Object?> get props => [];
}
class LoadingChangeDelete2State extends ChatState{
  @override
  List<Object?> get props => [];
}
class SuccessChangeDelete2State extends ChatState{
  @override
  List<Object?> get props => [];
}

class LoadingChangeSearchState  extends ChatState{
  @override
  List<Object?> get props => [];
}
class SuccessChangeSearchState extends ChatState{
  @override
  List<Object?> get props => [];
}

class LoadingGetContactSearchState  extends ChatState{
  @override
  List<Object?> get props => [];
}
class SuccessGetContactSearchState extends ChatState{
  @override
  List<Object?> get props => [];
}
class ErrorGetContactSearchState extends ChatState{
  @override
  List<Object?> get props => [];
}
class SetContactChatLoadingState extends ChatState{
}

class SetContactChatSuccessState extends ChatState{
}
class SetContactChatErrorState extends ChatState{
}class GetContactChatLoadingState extends ChatState{
}

class GetContactChatSuccessState extends ChatState{
}
class GetContactChatErrorState extends ChatState{
}
