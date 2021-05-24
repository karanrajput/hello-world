import 'package:bkdschool/data/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

enum RMessageType {
  from,
  TEXT,
  IMAGE,
  VIDEO,
  YOUTUBE,
  VOICE,
  TEST,
  RESULT,
}

extension RMessageTypeExtension on RMessageType {
  static const values = [
    "",
    "text",
    "image",
    "video",
    "youtube",
    "voice",
    "test",
    "result"
  ];
  String get value => values[this.index];
  operator [](String key) => RMessageType.values
      .firstWhere((e) => e.toString() == 'RMessageType.' + key.toUpperCase());
}

class RMessage extends HiveObject {
  String docid;
  final String message;
  final String by;
  final DateTime timestamp;
  final RMessageType type;
  String name;
  String subjectuid;
  RUserType usertype;

  RMessage({
    this.docid,
    this.message,
    this.by,
    this.timestamp,
    this.type,
    this.name,
    this.subjectuid,
    this.usertype,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'by': by,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'type': type.value,
      'subjectuid': subjectuid,
      'usertype': usertype.value,
    };
  }

  factory RMessage.fromMap(Map<String, dynamic> map) {
    return RMessage(
      message: map['message'],
      by: map['by'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      type: RMessageType.from[map['type']],
      subjectuid: map['subjectuid'] ?? '',
      usertype: RUserType.from[map['usertype'] ?? 'student'],
    );
  }

  //Hive
  Map<String, dynamic> toLocalMap() {
    return {
      'docid': docid,
      'message': message,
      'by': by,
      'timestamp': timestamp,
      'type': type.value,
      'name': name,
      'subjectuid': subjectuid,
      'usertype': usertype.value,
    };
  }

  factory RMessage.fromLocalMap(Map<dynamic, dynamic> map) {
    return RMessage(
      docid: map['docid'],
      message: map['message'],
      by: map['by'],
      timestamp: map['timestamp'],
      type: RMessageType.from[map['type']],
      usertype: RUserType.from[map['usertype'] ?? 'student'],
      name: map['name'] ?? '',
      subjectuid: map['subjectuid'] ?? '',
    );
  }
}
