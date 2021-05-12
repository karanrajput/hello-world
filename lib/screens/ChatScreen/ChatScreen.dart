import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/messagewidget.dart';
import 'package:bkdschool/bloc/chat_bloc/chat_bloc.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
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

  _sendMessage() {
    String mes = messageController.text;
    messageController.text = "";
    //FocusManager.instance.primaryFocus.unfocus();

    var r = RMessage(
      message: mes,
      type: RMessageType.TEXT,
      by: "this",
    );
    messages.add(r);
    scrollController.jumpTo(scrollController.position.maxScrollExtent);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: widget.subject.name,
      //bgColor: Colors.white.withAlpha(100),
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
                    RIconButton(
                      color: Colors.transparent,
                      iconColor: Globals.colorMain,
                      icon: Icons.read_more,
                      onPressed: () {
                        String mes = messageController.text;
                        messageController.text = "";
                        //FocusManager.instance.primaryFocus.unfocus();

                        var r = RMessage(
                          message: mes,
                          type: RMessageType.TEXT,
                          by: "that",
                        );
                        messages.add(r);

                        setState(() {});
                      },
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

  List<RMessage> messages = [];

  Widget _makeMessagesList() {
    return ListView.builder(
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
        });
  }
}
