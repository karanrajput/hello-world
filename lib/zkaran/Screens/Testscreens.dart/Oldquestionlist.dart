import 'package:bkdschool/zkaran/Allscreentheme.dart';
import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Testmaterial.dart';
import 'package:flutter/material.dart';

class Oldquestions extends StatefulWidget {
  Oldquestions({Key key}) : super(key: key);

  @override
  _OldquestionsState createState() => _OldquestionsState();
}

class _OldquestionsState extends State<Oldquestions> {
  @override
  Widget build(BuildContext context) {
    return Globaltheme(
      name: "Chaptor 1 Test",
      sname: "Date: 25-04-2021",
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Questions(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Questions(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Questions(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Questions(),
            ),
          ],
        ),
      ),
    );
  }
}
