import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:flutter/material.dart';

class AdminAddSubjectPage extends StatelessWidget {
  final RClass rclass;

  AdminAddSubjectPage({Key key, this.rclass}) : super(key: key);
  final nameController = TextEditingController();

  _addSubject(BuildContext context) async {
    var subject = RSubject(name: nameController.text, rclass: rclass);
    await FireRepo.instance.addNewSubject(subject);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return makeCardContainer(
        alpha: 240,
        child: Material(
          color: Colors.transparent,
          child: makeScroll(
            child: Column(
              children: [
                RTextField(
                  label: "Subject Name",
                  controller: nameController,
                ),
                makeSpace(50),
                RButton(
                  text: "Add Subject",
                  expand: true,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  onPressed: () => _addSubject(context),
                )
              ],
            ),
          ),
        ));
  }
}
