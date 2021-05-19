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

  RMessage({
    this.docid,
    this.message,
    this.by,
    this.timestamp,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'by': by,
      'timestamp': Timestamp.fromDate(timestamp),
      'type': type.value,
    };
  }

  factory RMessage.fromMap(Map<String, dynamic> map) {
    return RMessage(
      message: map['message'],
      by: map['by'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      type: RMessageType.from[map['type']],
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
    };
  }

  factory RMessage.fromLocalMap(Map<dynamic, dynamic> map) {
    return RMessage(
      docid: map['docid'],
      message: map['message'],
      by: map['by'],
      timestamp: map['timestamp'],
      type: RMessageType.from[map['type']],
    );
  }
}
