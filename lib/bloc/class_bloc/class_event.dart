part of 'class_bloc.dart';

@immutable
abstract class ClassEvent {}

//Class
class ClassEventLoadClassList extends ClassEvent {}

//Subject
class ClassEventLoadSubjectList extends ClassEvent {
  final RClass rclass;

  ClassEventLoadSubjectList(this.rclass);
}
