import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/class_bloc/class_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/ChatScreen/ChatScreen.dart';
import 'package:bkdschool/screens/ChatScreen/chatscreen%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatefulWidget {
  final RClass rclass;

  const SubjectsPage({Key key, this.rclass}) : super(key: key);

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  void initState() {
    super.initState();
    ChatRepo.instance.init(Globals.instance.subjects).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "Subjects",
      child: Container(
          child: _makeSubjectsList(context, Globals.instance.subjects)),
    );
  }

  Widget _makeSubjectsList(BuildContext context, List<RSubject> subjects) {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (contextn, index) {
          return RSubjectChatItemWidget(
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
