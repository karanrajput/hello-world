import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/AdminScreen/SubScreens/AdminStudentsScreen.dart';
import 'package:flutter/material.dart';
import 'Pages/AdminAddSubject.dart';

class AdminClassDetailScreen extends StatelessWidget {
  final RClass rclass;

  const AdminClassDetailScreen({Key key, this.rclass}) : super(key: key);

  _addSubject(BuildContext context) {
    Globals.makeRPopup(
        AdminAddSubjectPage(
          rclass: rclass,
        ),
        'addsubject');
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "Class Details",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<List<RSubject>>(
            stream: FireRepo.instance.getSubjectsListStream(rclass),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _makeSubjectBar(context, snapshot.data);
              } else if (snapshot.hasError) {
                return makeCenterContainer(makeIconText("Error", Icons.error));
              } else {
                return _makeSubjectBar(context, []);
              }
            },
          ),
          makeSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: makeText("Students", fontSize: 20),
          ),
          Expanded(
            child: AdminStudentsScreen(
              rclass: rclass,
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeSubjectBar(BuildContext context, List<RSubject> subjects) {
    Widget button = SizedBox(
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Hero(
          tag: 'addsubject',
          child: RButton(
            borderRadius: 20,
            child: Icon(
              Icons.add,
              size: 40,
            ),
            onPressed: () => _addSubject(context),
          ),
        ),
      ),
    );
    return Container(
      height: 150,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: subjects.length + 1,
        itemBuilder: (context, i) {
          return (i != subjects.length)
              ? SizedBox(
                  width: 150,
                  child: RSubjectItemWidget(
                    subject: subjects[i],
                    onPressed: () {},
                  ),
                )
              : button;
        },
      ),
    );
  }
}
