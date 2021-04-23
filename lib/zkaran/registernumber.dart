import 'package:bkdschool/zkaran/buttons.dart';
import 'package:bkdschool/zkaran/registration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Registernumber extends StatefulWidget {
  Registernumber({Key key}) : super(key: key);

  @override
  _RegisternumberState createState() => _RegisternumberState();
}

class _RegisternumberState extends State<Registernumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Number Registration"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter Your Mobile Number",
                  style: TextStyle(
                    fontFamily: "sf",
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Rtextfield(
                  inputType: TextInputType.phone,
                  textColor: Colors.black,
                  height: 80,
                  boxcolor: Color.fromARGB(255, 220, 218, 254),
                  labeltext: "Phone Number",
                  hinttext: "Enter Your Number",
                ),
                SizedBox(
                  height: 50,
                ),
                RButton(
                  text: "Register",
                  textColor: Colors.black,
                  color: Color.fromARGB(255, 220, 218, 254),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ));
  }
}
