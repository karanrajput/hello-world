import 'package:bkdschool/data/models/ClassModel.dart';

class RSubject {
  RClass rclass;
  String docid;
  final String name;

  RSubject({
    this.docid,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory RSubject.fromMap(Map<String, dynamic> map) {
    return RSubject(
      name: map['name'],
    );
  }
}
