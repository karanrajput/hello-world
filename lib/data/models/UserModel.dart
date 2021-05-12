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
  String uid;
  final String rollno;
  final String username;
  final String name;
  final RUserType type;
  final String email;
  final String contactnumber;
  final String fathername;
  final String mothername;
  final String classaccess;

  final bool completeUser;

  RUser(
      {this.classaccess,
      this.rollno,
      this.uid,
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
        'rollno': rollno,
        'contactnumber': contactnumber,
        'fathername': fathername,
        'mothername': mothername,
        'username': username,
        'name': name,
        'type': type.value,
        'email': email,
        'completeuser': completeUser,
        'class_access': classaccess,
      };

  factory RUser.fromMap(Map<String, dynamic> map) {
    return RUser(
        uid: map['uid'],
        classaccess: map['class_access'] ?? '',
        rollno: map['rollno'] ?? "",
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
