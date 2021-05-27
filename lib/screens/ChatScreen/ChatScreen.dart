import 'dart:convert';
import 'dart:io';

import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/messagewidget.dart';
import 'package:bkdschool/bloc/chat_bloc/chat_bloc.dart';
import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/AdminScreen/SubScreens/Exam/Adminexampage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

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

//jitsi meet
  _joinMeeting() async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String roomname =
          'room_class_' + widget.subject.rclass.docid + widget.subject.docid;

      var options = JitsiMeetingOptions(room: roomname);

      var r = RMessage(
        message: roomname,
        type: RMessageType.LIVE,
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

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }

  RUser currentUser;
  bool fileUploading = false;

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
                    onPressed: _joinMeeting,
                    icon: const Icon(Icons.video_call_rounded))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Globals.navigateScreen(AdminExamPage());
                    },
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
                    fileUploading
                        ? CircularProgressIndicator()
                        : RIconButton(
                            icon: Icons.file_present,
                            color: Colors.transparent,
                            iconColor: Colors.black,
                            onPressed: fileUploading
                                ? null
                                : () async {
                                    FilePickerResult result = await FilePicker
                                        .platform
                                        .pickFiles(allowMultiple: true);

                                    if (result != null) {
                                      for (var file in result.files) {
                                        setState(() {
                                          fileUploading = true;
                                        });
                                        var uid = Uuid().v1();
                                        var r = await http.post(
                                            Uri.http('scaptor.com',
                                                'bkdschool/bkdup.php'),
                                            body: {
                                              "image": base64Encode(
                                                  File(file.path)
                                                      .readAsBytesSync()),
                                              "name": uid + file.name,
                                            });
                                        print(r.statusCode);
                                        if (r.statusCode == 200) {
                                          var r = RMessage(
                                            message: uid + file.name,
                                            type: RMessageType.IMAGE,
                                            by: currentUser.uid,
                                            timestamp: DateTime.now(),
                                            name: currentUser.name,
                                            subjectuid: widget.subject.docid,
                                            usertype: FireRepo
                                                .instance.currentUser.type,
                                          );
                                          waitingMessages.add(r);

                                          ChatRepo.instance
                                              .sendMessageToSubject(
                                                  widget.subject, r);

                                          scrollController.jumpTo(
                                              scrollController
                                                  .position.maxScrollExtent);

                                          setState(() {});
                                        } else {}
                                        setState(() {
                                          fileUploading = false;
                                        });
                                      }
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
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
