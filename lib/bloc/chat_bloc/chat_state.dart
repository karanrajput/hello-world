part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatLoading extends ChatState {}

class ChatStateListLoaded extends ChatState {
  final List<RMessage> messages;

  ChatStateListLoaded(this.messages);
}

class ChatStateError extends ChatState {
  final String message;

  ChatStateError(this.message);
}
