part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ChatEventLoadChat extends ChatEvent {
  final RSubject subject;

  ChatEventLoadChat(this.subject);
}
