import 'package:bkdschool/zkaran/buttons.dart';
import 'package:flutter/material.dart';

class Addsubjectpopup extends StatefulWidget {
  Addsubjectpopup({Key key}) : super(key: key);

  @override
  _AddsubjectpopupState createState() => _AddsubjectpopupState();
}

class _AddsubjectpopupState extends State<Addsubjectpopup> {
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
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(255, 220, 218, 254),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Rtextfield(
                    labeltext: "Subject",
                    hinttext: "Subject Name",
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
