import 'package:bkdschool/data/models/SubjectModel.dart';
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                    child: makeText(subject.name,
                        fontSize: 25, alignment: TextAlign.left)),
                Container(
                  height: 25,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 1, bottom: 1),
                    child: makeText("1", color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
