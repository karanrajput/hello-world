part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ChatEventInit extends ChatEvent {
  final List<RSubject> subs;

  ChatEventInit(this.subs);
}

class ChatEventLoadChat extends ChatEvent {
  final String subject;

  ChatEventLoadChat(this.subject);
}

class ChatEventMessageAdded extends ChatEvent {
  final RMessage message;

  ChatEventMessageAdded(this.message);
}
