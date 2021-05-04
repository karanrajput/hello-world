import 'dart:async';

import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'class_event.dart';
part 'class_state.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  ClassBloc() : super(ClassStateLoading());

  @override
  Stream<ClassState> mapEventToState(
    ClassEvent event,
  ) async* {
    if (event is ClassEventLoadClassList) {
      yield ClassStateLoading();
      final classes = await FireRepo.instance.getClassesList();
      yield ClassStateClassListLoaded(classes);
    }

    //Subjects
    if (event is ClassEventLoadSubjectList) {
      yield ClassStateSubjectsLoading();
      final subjects = await FireRepo.instance.getSubjectsOfClass(event.rclass);
      yield ClassStateSubjectListLoaded(subjects);
    }
  }
}
