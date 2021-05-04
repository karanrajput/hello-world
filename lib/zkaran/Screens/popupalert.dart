import 'package:bkdschool/zkaran/Screens/studentregistration.dart';
import 'package:bkdschool/zkaran/Screens/teacherregistration.dart';
import 'package:flutter/material.dart';

class Studentpopupalert extends StatefulWidget {
  Studentpopupalert({Key key}) : super(key: key);

  @override
  _StudentpopupalertState createState() => _StudentpopupalertState();
}

class _StudentpopupalertState extends State<Studentpopupalert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        content: Stack(
          alignment: Alignment.center,
          // ignore: deprecated_member_use
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Icon(Icons.close, color: Colors.black),
                  backgroundColor: Colors.white30,
                ),
              ),
            ),
            Form(
              // key: _formKey,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color.fromARGB(255, 220, 218, 254),
                  ),
                  child: Studentregistration()),
            ),
          ],
        ),
      ),
    );
  }
}

class Teacherpopupalert extends StatelessWidget {
  const Teacherpopupalert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        content: Stack(
          alignment: Alignment.center,
          // ignore: deprecated_member_use
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              right: -40.0,
              top: -40.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  child: Icon(Icons.close, color: Colors.black),
                  backgroundColor: Colors.white30,
                ),
              ),
            ),
            Form(
              // key: _formKey,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color.fromARGB(255, 220, 218, 254),
                  ),
                  child: Teacherregistartion()),
            ),
          ],
        ),
      ),
    );
  }
}
