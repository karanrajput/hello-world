part of 'class_bloc.dart';

@immutable
abstract class ClassState {}

class ClassStateLoading extends ClassState {}

class ClassStateClassListLoaded extends ClassState {
  final List<RClass> clases;

  ClassStateClassListLoaded(this.clases);
}

//
//Subjects
//

class ClassStateSubjectsLoading extends ClassState {}

class ClassStateSubjectListLoaded extends ClassState {
  final List<RSubject> subjects;

  ClassStateSubjectListLoaded(this.subjects);
}
