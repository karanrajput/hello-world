import 'dart:async';

import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatLoading());

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    try {
      if (event is ChatEventLoadChat) {
        yield ChatLoading();
        //final messages = await FireRepo.instance.getMessages(event.subject);
        final List<RMessage> mess = await ChatRepo.instance.getMessages();
        yield ChatStateListLoaded(mess);
      }
    } catch (e) {
      yield ChatStateError(e.toString());
    }
  }
}
