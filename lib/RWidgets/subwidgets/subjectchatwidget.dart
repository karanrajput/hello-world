import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:flutter/material.dart';

import '../RWidgets.dart';

class RSubjectChatItemWidget extends StatelessWidget {
  final RSubject subject;
  final VoidCallback onPressed;

  const RSubjectChatItemWidget({Key key, this.subject, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: 60,
        child: makeCardContainer(
          radius: 10,
          clickable: true,
          onPressed: onPressed,
          child: Row(
            children: [
              Column(
                children: [makeText(subject.name)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
