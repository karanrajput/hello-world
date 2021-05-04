import 'package:bkdschool/zkaran/buttons.dart';
import 'package:flutter/material.dart';

class Addstudentpopup extends StatefulWidget {
  Addstudentpopup({Key key}) : super(key: key);

  @override
  _AddstudentpopupState createState() => _AddstudentpopupState();
}

class _AddstudentpopupState extends State<Addstudentpopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Stack(
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
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 220, 218, 254),
              ),
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
                    labeltext: "Subject",
                    hinttext: "Subject",
                    textColor: Colors.black,
                  ),
                  Rtextfield(
                    labeltext: "ID",
                    hinttext: "ID Number",
                    textColor: Colors.black,
                  ),
                  Rtextfield(
                    labeltext: "Phone",
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
          ],
        ),
      ),
    );
  }
}
