import 'dart:convert';
import 'package:bkdschool/bloc/chat_bloc/chat_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/NotifRepo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:bkdschool/data/models/MessageModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';

class ChatRepo {
  static final ChatRepo instance = ChatRepo._internal();
  factory ChatRepo() {
    return instance;
  }
  ChatRepo._internal();

  ///
  ///
  ///

  final FirebaseMessaging fcm = FirebaseMessaging.instance;

  ///
  ///
  ///
  ///

  subscribe({String classID}) {
    fcm.subscribeToTopic('class' + classID);
  }

  unsubscribe({String classID}) {
    fcm.subscribeToTopic('class' + classID);
  }

  Future<Box> getSubjectBox(String subjectuid) async {
    return await Hive.openBox('messages-' + subjectuid);
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  BuildContext acontext;
  setContext(BuildContext context) {
    acontext = context;
  }

  Future<void> init(List<RSubject> subs) async {
    //load any new message from firebase
    for (var sub in subs) {
      var r = await FireRepo.instance.getMessages(sub);
      var box = await getSubjectBox(sub.docid);
      for (var message in r) {
        var ruser = await FireRepo.instance.getRUserFromUID(message.by);
        message.name = ruser.name;
        await box.add(message.toLocalMap());
      }
    }
  }

  Future<void> clearAndLoadAllMessages(String classid) async {
    var cl = RClass(docid: classid);
    var subs = await FireRepo.instance.getSubjectsOfClass(cl);
    for (var sub in subs) {
      var box = await getSubjectBox(sub.docid);
      await box.clear();
      var messages = await FireRepo.instance.getAllMessages(sub);
      for (var mes in messages) {
        var ruser = await FireRepo.instance.getRUserFromUID(mes.by);
        mes.name = ruser.name;
        await box.add(mes.toLocalMap());
      }
    }
  }

  //
  //
  //
  Future<List<RMessage>> getMessages(String subjectuid) async {
    var messagesBox = await getSubjectBox(subjectuid);
    if (messagesBox.isEmpty) {
      return List<RMessage>.empty();
    } else {
      return messagesBox.values.map((e) => RMessage.fromLocalMap(e)).toList();
    }
  }

  sendMessageToSubject(RSubject subject, RMessage message) async {
    //var messagesBox = await getSubjectBox(message.subjectuid);
    //messagesBox.add(message.toLocalMap());

    var mesid = await FireRepo.instance.putMessage(subject, message);
    sendFCMMessage(
      'class' + subject.rclass.docid,
      {
        'type': 'chat_message',
        'classid': subject.rclass.docid,
        'subjectid': subject.docid,
        'messageid': mesid,
      },
    );

    //BlocProvider.of<ChatBloc>(acontext).add(ChatEventMessageAdded(message));
  }

  recieveFCMMessage(RemoteMessage message, bool showNotif) async {
    String fcmtype = message.data['type'];
    if (fcmtype == 'chat_message') {
      String classid = message.data['classid'];
      String subjectid = message.data['subjectid'];
      String messageid = message.data['messageid'];

      var messagesBox = await getSubjectBox(subjectid);

      RSubject subject =
          await FireRepo.instance.getSubjectFromID(classid, subjectid);
      RMessage mes = await FireRepo.instance
          .getMessageFromID(classid, subjectid, messageid);
      RUser ruser = await FireRepo.instance.getRUserFromUID(mes.by);
      mes.name = ruser.name;
      messagesBox.add(mes.toLocalMap());

      //Notif
      if (showNotif && mes.by != FireRepo.instance.currentUser.uid) {
        NotifRepo.instance.showNotifications(
            mes.hashCode, subject.name, ruser.name + " : " + mes.message);
      }
      BlocProvider.of<ChatBloc>(acontext).add(ChatEventMessageAdded(mes));
    }
  }

  sendFCMMessage(String topic, Map<String, String> data) async {
    var s = jsonEncode({
      'to': '/topics/' + topic,
      'data': data,
    });
    try {
      var r = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'key=AAAA6_tZ2Yc:APA91bGnOg19oJc8Unx2UUXiGGwP2E7rBxm0ZSf5WUie0hOwCS1wYZYfvqforfpVoXDkqbM0kHlQPD0S1XXDiJfLtVe3BQl8FoKhUTd_y4e3Rlc_TxRr0bgq-Cqtp9en__DTOr4Hv38m',
        },
        body: s,
      );
      print('FCM request for device sent   ' + r.body);
    } catch (e) {
      print(e);
    }
  }
}
