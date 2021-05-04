import 'package:flutter/material.dart';

import '../buttons.dart';

class Studentregistration extends StatefulWidget {
  Studentregistration({Key key}) : super(key: key);

  @override
  _StudentregistrationState createState() => _StudentregistrationState();
}

class _StudentregistrationState extends State<Studentregistration> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Rtextfield(
              labeltext: "Name",
              hinttext: "Student Name",
              textColor: Colors.black,
            ),
            Rtextfield(
              labeltext: "Email",
              hinttext: "Student Email ID",
              textColor: Colors.black,
            ),
            Rtextfield(
              labeltext: "Class",
              hinttext: "Class",
              textColor: Colors.black,
            ),
            Rtextfield(
              labeltext: "ID",
              hinttext: "Roll Number",
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
                  text: "Submit",
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
