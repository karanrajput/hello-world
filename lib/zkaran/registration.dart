import 'package:bkdschool/zkaran/buttons.dart';
import 'package:bkdschool/zkaran/registernumber.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Registerscreen extends StatefulWidget {
  Registerscreen({Key key}) : super(key: key);

  @override
  _RegisterscreenState createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registration"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login To Register",
                  style: TextStyle(
                    fontFamily: "sf",
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RButton(
                  icon: Icon(FontAwesomeIcons.google, color: Colors.red),
                  text: "Login With Google Account",
                  textColor: Colors.black,
                  color: Color.fromARGB(255, 220, 218, 254),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registernumber()),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}

//register number
