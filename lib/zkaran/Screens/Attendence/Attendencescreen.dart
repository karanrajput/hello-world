import 'package:bkdschool/zkaran/Allscreentheme.dart';
import 'package:bkdschool/zkaran/Screens/Attendence/Attendencecard.dart';
import 'package:flutter/material.dart';

class Attendencescreen extends StatelessWidget {
  const Attendencescreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Globaltheme(
      name: "Class 10 ",
      sname: "Attendence \n Subject = English",
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Attendencecard(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Attendencecard(),
          ),
        ],
      ),
    );
  }
}
