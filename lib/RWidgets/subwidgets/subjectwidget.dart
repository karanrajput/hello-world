import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';

class RSubjectItemWidget extends StatelessWidget {
  final RSubject subject;
  final bool selected;
  final VoidCallback onPressed;

  const RSubjectItemWidget(
      {Key key, this.subject, this.onPressed, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: makeCardContainer(
        color: selected ? Globals.colorMain : Colors.white,
        alpha: selected ? 200 : 50,
        clickable: true,
        onPressed: onPressed,
        child: makeCenterContainer(makeText(subject.name, fontSize: 20)),
      ),
    );
  }
}
