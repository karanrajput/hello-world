import 'package:bkdschool/data/models/ClassModel.dart';

class RSubject {
  RClass rclass;
  String docid;
  final String name;
  final bool isOptional;

  RSubject({
    this.rclass,
    this.name,
    this.isOptional,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isOptional': isOptional,
    };
  }

  factory RSubject.fromMap(Map<String, dynamic> map) {
    return RSubject(
      name: map['name'],
      isOptional: map['isOptional'] ?? false,
    );
  }
}
