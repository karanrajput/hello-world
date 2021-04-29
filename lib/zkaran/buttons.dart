import 'dart:ui';

import 'package:bkdschool/zkaran/Screens/listofclasses.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

//Menubutton

class Menubutton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double iconsize;
  final VoidCallback onpressed;
  final double height;

  const Menubutton({
    this.icon = FontAwesomeIcons.dashcube,
    this.text = "Dashboard",
    this.iconsize = 20,
    this.onpressed,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 220, 218, 254),
      ),
      height: height,
      width: 400,
      child: InkWell(
        onTap: onpressed,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: iconsize,
              ),
              VerticalDivider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// thin buutton

class Thinbutton extends StatelessWidget {
  const Thinbutton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 220, 218, 254),
      ),
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black45,
              width: 3.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: InkWell(
            onTap: () => null,
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 20,
                  ),
                  VerticalDivider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'My Profile',
                        style: GoogleFonts.workSans(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//simple button

class RButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color color;
  final Color textColor;
  final double fontSize;
  final VoidCallback onPressed;
  final bool enabled;
  final Widget icon;

  final EdgeInsets padding;
  final double elevation;

  const RButton(
      {this.text = "Button",
      this.onPressed,
      this.borderRadius = 50,
      this.fontSize = 20,
      this.color = Colors.blue,
      this.enabled = true,
      this.icon,
      this.textColor = Colors.white,
      this.padding = const EdgeInsets.all(10.0),
      this.elevation = 2});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null ? icon : Container(),
            SizedBox(
              width: icon != null ? 10 : 0,
            ),
            Text(text, style: TextStyle(fontSize: fontSize, color: textColor))
          ],
        ),
      ),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)))),
    );
  }
}

//floating input field

class Rtextfield extends StatelessWidget {
  final String text;
  final String labeltext;
  final String hinttext;
  final Color color;
  final Color boxcolor;
  final Color textColor;
  final double fontSize;
  final double height;
  final TextInputType inputType;
  final VoidCallback onPressed;
  final bool enabled;
  final Widget icon;
  final EdgeInsets padding;
  final double elevation;

  const Rtextfield(
      {this.text = "Button",
      this.labeltext = "Name",
      this.hinttext = "hint text",
      this.onPressed,
      this.fontSize = 20,
      this.height = 80,
      this.color = Colors.blue,
      this.boxcolor = Colors.transparent,
      this.inputType = TextInputType.text,
      this.enabled = true,
      this.icon,
      this.textColor = Colors.white,
      this.padding = const EdgeInsets.all(10.0),
      this.elevation = 2});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: boxcolor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
          child: TextField(
              minLines: 1,
              maxLines: 5,
              keyboardType: inputType,
              style: GoogleFonts.workSans(fontSize: fontSize, color: textColor),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black87),
                  labelText: labeltext,
                  hintText: hinttext)),
        ));
  }
}

//dropdown textfield

class DDD extends StatefulWidget {
  DDD({Key key}) : super(key: key);

  @override
  _DDDState createState() => _DDDState();
}

class _DDDState extends State<DDD> {
  String dropdownValue = 'Select';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 220, 218, 254),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 65,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 2),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Positioned(
            right: 50,
            child: Icon(
              Icons.arrow_downward,
            ),
          ),
          iconSize: 20,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['Select', 'One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

//Drop Down Text Field

class DDtextfield extends StatefulWidget {
  DDtextfield({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DDtextfieldState createState() => _DDtextfieldState();
}

class _DDtextfieldState extends State<DDtextfield> {
  String dropDownValue;
  List<String> cityList = [
    'Ajman',
    'Al Ain',
    'Dubai',
    'Fujairah',
    'Ras Al Khaimah',
    'Sharjah',
    'Umm Al Quwain'
  ];

  @override
  void initState() {
    //setFilters();
    super.initState();
  }

  setFilters() {
    setState(() {
      dropDownValue = cityList[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 220, 218, 254),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      filled: false,
                      hintStyle: GoogleFonts.ptSans(fontSize: 20),
                      hintText: "City Name",
                      fillColor: Colors.blue[200]),
                  value: dropDownValue,
                  style:
                      GoogleFonts.ptSans(fontSize: 20, color: Colors.black87),
                  // ignore: non_constant_identifier_names
                  onChanged: (String Value) {
                    setState(() {
                      dropDownValue = Value;
                    });
                  },
                  items: cityList
                      .map((cityTitle) => DropdownMenuItem(
                          value: cityTitle, child: Text("$cityTitle")))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Classnumbercard extends StatelessWidget {
  final String text;
  final int students;

  const Classnumbercard({this.text = "12th", this.students = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Studentclasslistscreen()),
          );
        },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Detalslist extends StatefulWidget {
  Detalslist({Key key}) : super(key: key);

  @override
  _DetalslistState createState() => _DetalslistState();
}

class _DetalslistState extends State<Detalslist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      child: Text(
                        "Mr. Student",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      child: Text(
                        "Roll No.",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      child: Text(
                        "3290",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      child: Text(
                        "Father's Name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Mr. Father",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      child: Text(
                        "Address",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      child: Text(
                        "This is a very very very very long address of the " +
                            "student of bkd school",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
