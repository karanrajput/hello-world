enum RNotificationFor { from, STUDENT, TEACHER, BOTH, NONE }

extension RNotificationForExtension on RNotificationFor {
  static const values = ["", "student", "teacher", "both", "none"];
  String get value => values[this.index];
  operator [](String key) => RNotificationFor.values.firstWhere(
      (e) => e.toString() == 'RNotificationFor.' + key.toUpperCase());
}

class RNotification {
  String docid;
  final String heading;
  final String description;
  final DateTime lastdate;
  final RNotificationFor notificationFor;

  RNotification({
    this.notificationFor,
    this.heading,
    this.description,
    this.lastdate,
  });

  Map<String, dynamic> toMap() {
    return {
      'heading': heading,
      'description': description,
      'lastdate': lastdate.millisecondsSinceEpoch,
      "notificationFor": notificationFor.value,
    };
  }

  factory RNotification.fromMap(Map<String, dynamic> map) {
    return RNotification(
      heading: map['heading'],
      description: map['description'],
      lastdate: DateTime.fromMillisecondsSinceEpoch(map['lastdate']),
      notificationFor: RNotificationFor.from[map['notificationFor'] ?? "both"],
    );
  }
}
