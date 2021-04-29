import 'package:bkdschool/RWidgets/buttons.dart';
import 'package:bkdschool/zkaran/Screens/Allstudentlist.dart';
import 'package:bkdschool/zkaran/Screens/subjectlist.dart';
import 'package:flutter/material.dart';

class Classescard extends StatelessWidget {
  final String text;
  final int students;

  const Classescard({this.text = "12th", this.students = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                students.toString(),
                style: TextStyle(fontSize: 20),
              ),
              RButton(
                text: "Students",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Allstudentlist()),
                  );
                },
              ),
              RButton(
                text: "Classes",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Subjectlist()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
