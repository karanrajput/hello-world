import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/messagewidget.dart';
import 'package:bkdschool/bloc/chat_bloc/chat_bloc.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  final RSubject subject;

  ChatScreen({Key key, this.subject}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  final messageFocus = FocusNode();

  ///
  ///

  List<RMessage> messages = [];
  List<RMessage> waitingMessages = [];

  _sendMessage() {
    String mes = messageController.text;
    messageController.text = "";
    //FocusManager.instance.primaryFocus.unfocus();

    var r = RMessage(
      message: mes,
      type: RMessageType.TEXT,
      by: currentUser.uid,
      timestamp: DateTime.now(),
      name: currentUser.name,
      subjectuid: widget.subject.docid,
      usertype: FireRepo.instance.currentUser.type,
    );
    waitingMessages.add(r);

    ChatRepo.instance.sendMessageToSubject(widget.subject, r);

    scrollController.jumpTo(scrollController.position.maxScrollExtent);

    setState(() {});
  }

  RUser currentUser;
  @override
  void initState() {
    super.initState();
    currentUser = FireRepo.instance.currentUser;
    ChatRepo.instance.setContext(context);
    BlocProvider.of<ChatBloc>(context)
        .add(ChatEventLoadChat(widget.subject.docid));
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: widget.subject.name,
      actions: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.video_call_rounded))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.request_page_rounded))),
          ],
        )
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Column(
          children: [
            Expanded(child: _makeMessagesList()),
            SizedBox(
              child: Material(
                elevation: 20,
                color: Colors.white,
                child: Row(
                  children: [
                    makeSpace(10, true),
                    RIconButton(
                      icon: Icons.file_present,
                      color: Colors.transparent,
                      iconColor: Colors.black,
                      onPressed: () {},
                      iconSize: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          minLines: 1,
                          maxLines: 4,
                          focusNode: messageFocus,
                          controller: messageController,
                          scrollPhysics: BouncingScrollPhysics(),
                          decoration: InputDecoration(
                              hintText: "type a message...",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    RIconButton(
                      color: Colors.transparent,
                      iconColor: Globals.colorMain,
                      icon: Icons.send,
                      onPressed: _sendMessage,
                    ),
                    makeSpace(10, true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeMessagesList() {
    return BlocListener<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is ChatStateListLoaded) {
          messages.clear();
          messages.addAll(state.messages);
        }
        if (state is ChatStateMessageAdded) {
          if (state.message.subjectuid == widget.subject.docid) {
            messages.add(state.message);
          }
        }
        setState(() {});
      },
      child: ListView.builder(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          itemCount: messages.length,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
          itemBuilder: (context, i) {
            return RMessageItemWidget(
              message: messages[i],
              prevMessage: i - 1 < 0 ? null : messages[i - 1],
              nextMessage: i + 1 >= messages.length ? null : messages[i + 1],
            );
          }),
    );
  }
}
