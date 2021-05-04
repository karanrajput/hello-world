//RUser Type
enum RUserType { from, STUDENT, TEACHER, ADMIN }

extension RUserTypeExtension on RUserType {
  static const values = ["", "student", "teacher", "admin"];
  String get value => values[this.index];
  operator [](String key) => RUserType.values
      .firstWhere((e) => e.toString() == 'RUserType.' + key.toUpperCase());
}
//

class RUser {
  final uid;
  final String username;
  final String name;
  final RUserType type;
  final String email;
  final String contactnumber;
  final String fathername;
  final String mothername;

  final bool completeUser;

  RUser(
      {this.uid,
      this.contactnumber,
      this.fathername,
      this.mothername,
      this.username,
      this.name,
      this.type,
      this.email,
      this.completeUser = true});

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'contactnumber': contactnumber,
        'fathername': fathername,
        'mothername': mothername,
        'username': username,
        'name': name,
        'type': type.value,
        'email': email,
        'completeuser': completeUser
      };

  factory RUser.fromMap(Map<String, dynamic> map) {
    return RUser(
        uid: map['uid'],
        contactnumber: map['contactnumber'] ?? "",
        fathername: map['fathername'] ?? "",
        mothername: map['mothername'] ?? "",
        username: map['username'],
        name: map['name'],
        type: RUserType.from[map['type']],
        email: map['email'] ?? "",
        completeUser: map['completeuser'] ?? false);
  }
}
