import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';

class RSubjectItemWidget extends StatelessWidget {
  final RSubject subject;
  final VoidCallback onPressed;

  const RSubjectItemWidget({Key key, this.subject, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40,
          color: Globals.colorMain,
          child: makeCenterContainer(makeText(subject.name)),
        ),
      ),
    );
  }
}
