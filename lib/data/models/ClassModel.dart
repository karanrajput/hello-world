class RClass {
  String docid;
  final String code;
  final String name;
  final List<String> studentAccess;

  RClass({
    this.docid,
    this.code,
    this.name,
    this.studentAccess,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'student_access': studentAccess,
    };
  }

  factory RClass.fromMap(Map<String, dynamic> map) {
    return RClass(
      code: map['code'],
      name: map['name'],
      studentAccess: List<String>.from(map['student_access']),
    );
  }
}
