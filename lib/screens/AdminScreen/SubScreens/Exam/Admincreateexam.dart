import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/QuestionWidget.dart';
import 'package:bkdschool/data/models/questionmodal.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/AdminScreen/SubScreens/Exam/Adminaddexamquestion.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AdminCreateExamPage extends StatefulWidget {
  @override
  _AdminCreateExamPageState createState() => _AdminCreateExamPageState();
}

class _AdminCreateExamPageState extends State<AdminCreateExamPage> {
  Box box;
  List<RExamQsn> questionlist = [];

  _createExamPressed() async {
    FireRepo.instance.createNewExam(questionlist);

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    Hive.openBox("q").then((value) {
      box = value;
      box.values
          .cast<Map<String, dynamic>>()
          .toList()
          .map((e) => questionlist.add(RExamQsn.fromMap(e)));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      fab: FloatingActionButton(
        onPressed: () async {
          RExamQsn r = await Globals.makeRPopup(AdminAddQuestion(), 'fab');
          if (r != null) {
            questionlist.add(r);
            box.add(r.toMap());
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
      title: "Create Exam",
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: box == null
                    ? Container()
                    : ListView.builder(
                        itemCount: questionlist.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RQuestionItemWidget(
                                    question: questionlist[i]),
                              ),
                            ],
                          );
                        }),
              ),
              RButton(
                text: 'Create Exam',
                onPressed: _createExamPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
