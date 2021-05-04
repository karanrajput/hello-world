import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/class_bloc/class_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/ChatScreen/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatelessWidget {
  final RClass rclass;

  const SubjectsPage({Key key, this.rclass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClassBloc>(context).add(ClassEventLoadSubjectList(rclass));
    return RSimpleScaffold(
      title: rclass.name,
      child: BlocBuilder<ClassBloc, ClassState>(
        builder: (context, state) {
          if (state is ClassStateSubjectListLoaded) {
            return _makeSubjectsList(context, state.subjects);
          } else {
            return makeCenterContainer(makeLoadingIndicator(""));
          }
        },
      ),
    );
  }

  Widget _makeSubjectsList(BuildContext context, List<RSubject> subjects) {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (contextn, index) {
          return RSubjectItemWidget(
            subject: subjects[index],
            onPressed: () {
              Globals.navigateScreen(ChatScreen(
                subject: subjects[index],
              ));
            },
          );
        });
  }
}
