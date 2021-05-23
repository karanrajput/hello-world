import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';

class RSubjectItemWidget extends StatelessWidget {
  final RSubject subject;
  final bool selected;
  final VoidCallback onPressed;
  final VoidCallback onLongPressed;

  const RSubjectItemWidget(
      {Key key,
      this.subject,
      this.onPressed,
      this.selected = false,
      this.onLongPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: makeCardContainer(
        color: selected
            ? Globals.colorMain
            : subject.isOptional
                ? Colors.blueAccent
                : Colors.white,
        alpha: selected ? 200 : 50,
        clickable: true,
        onPressed: onPressed,
        onLongPressed: onLongPressed,
        child: makeCenterContainer(makeText(subject.name, fontSize: 20)),
      ),
    );
  }
}
