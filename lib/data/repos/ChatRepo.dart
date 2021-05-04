import 'dart:convert';
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

  //
  //
  //
  Future<List<RMessage>> getMessages() async {
    var messagesBox = await Hive.openBox('messages');
    if (messagesBox.isEmpty) {
      return List<RMessage>.empty();
    } else {
      return messagesBox.values.map((e) => RMessage.fromLocalMap(e)).toList();
    }
  }

  putMessages(RMessage message) async {
    var messagesBox = await Hive.openBox('messages');
    messagesBox.add(message.toLocalMap());
  }

  _sendFCMMessage(RSubject subject, RMessage message) async {
    var s = jsonEncode({
      'to': '/topics/testchannel',
      'data': {
        'class': subject.rclass.docid,
        'subject': subject.docid,
        'message': "message.docid",
      },
    });

    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: s,
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
}
