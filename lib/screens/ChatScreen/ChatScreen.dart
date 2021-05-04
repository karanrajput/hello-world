import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/messagewidget.dart';
import 'package:bkdschool/bloc/chat_bloc/chat_bloc.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  final RSubject subject;

  ChatScreen({Key key, this.subject}) : super(key: key);
  final messageController = TextEditingController();

  _sendMessage() {
    String mes = messageController.text;
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: subject.name,
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatStateListLoaded) {
                  return _makeMessagesList(state.messages);
                } else if (state is ChatStateError) {
                  return makeCenterContainer(makeText(state.message));
                } else {
                  return makeCenterContainer(
                      makeLoadingIndicator("laoding chat"));
                }
              },
            ),
          ),
          //
          //
          TextField(
            controller: messageController,
          ),
          RButton(
            text: "Send Message",
            onPressed: _sendMessage,
          )
        ],
      ),
    );
  }

  Widget _makeMessagesList(List<RMessage> messages) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return RMessageItemWidget(
            message: messages[index],
          );
        });
  }
}
