import 'package:flutter/material.dart';

import '../buttons.dart';

class Teacherregistartion extends StatefulWidget {
  Teacherregistartion({Key key}) : super(key: key);

  @override
  _TeacherregistartionState createState() => _TeacherregistartionState();
}

class _TeacherregistartionState extends State<Teacherregistartion> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Rtextfield(
              labeltext: "Name",
              hinttext: "Teacher Name",
              textColor: Colors.black,
            ),
            Rtextfield(
              labeltext: "Email",
              hinttext: "Teacher Email ID",
              textColor: Colors.black,
            ),
            Rtextfield(
              labeltext: "Subject",
              hinttext: "Subject",
              textColor: Colors.black,
            ),
            Rtextfield(
              labeltext: "ID",
              hinttext: "Employment ID",
              textColor: Colors.black,
            ),
            Rtextfield(
              labeltext: "Number",
              hinttext: "Phone Number",
              textColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RButton(
                  text: "Submit", color: Colors.blueAccent, onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
