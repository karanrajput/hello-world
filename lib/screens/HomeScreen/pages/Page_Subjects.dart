import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/class_bloc/class_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/ChatScreen/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatelessWidget {
  final RClass rclass;

  const SubjectsPage({Key key, this.rclass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<RSubject>>(
        stream: FireRepo.instance.getSubjectsListStream(rclass),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return makeCenterContainer(makeIconText(
                  "No Data", Icons.hourglass_empty,
                  color: Colors.black));
            } else {
              return _makeSubjectsList(context, snapshot.data);
            }
          } else if (snapshot.hasError) {
            return makeCenterContainer(makeIconText("Error", Icons.error));
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
