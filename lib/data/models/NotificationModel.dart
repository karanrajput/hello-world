import 'dart:convert';

class RNotification {
  String docid;
  final String heading;
  final String description;
  final DateTime lastdate;
  final bool forstudent;
  final bool forteacher;

  RNotification(
      {this.heading,
      this.description,
      this.lastdate,
      this.forstudent,
      this.forteacher});

  Map<String, dynamic> toMap() {
    return {
      'heading': heading,
      'description': description,
      'lastdate': lastdate.millisecondsSinceEpoch,
      'forstudent': forstudent,
      'forteacher': forteacher,
    };
  }

  factory RNotification.fromMap(Map<String, dynamic> map) {
    return RNotification(
      heading: map['heading'],
      description: map['description'],
      lastdate: DateTime.fromMillisecondsSinceEpoch(map['lastdate']),
      forstudent: map['forstudent'],
      forteacher: map['forteacher'],
    );
  }
}
