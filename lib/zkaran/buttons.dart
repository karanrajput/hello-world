import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bkdschool/zkaran/registration.dart';

//Menubutton

class Menubutton extends StatelessWidget {
  const Menubutton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 220, 218, 254),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 80,
      width: 250,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: InkWell(
            onTap: () => null,
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.dashboard_rounded,
                    size: 50,
                  ),
                  VerticalDivider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dashboard',
                        style: GoogleFonts.workSans(
                          fontSize: 25,
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
      this.boxcolor = Colors.blueAccent,
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
                    style: TextStyle(fontSize: 30),
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
  int _counter = 0;
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
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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

//date field

// class Datefield extends StatefulWidget {
//   Datefield({Key key}) : super(key: key);

//   @override
//   _DatefieldState createState() => _DatefieldState();
// }

// class _DatefieldState extends State<Datefield> {
//   String _selectedDate = '';
//   String _dateCount = '';
//   String _range = '';
//   String _rangeCount = '';

// setState(() {
//       if (args.value is PickerDateRange) {
//         _range =
//             DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
//                 ' - ' +
//                 DateFormat('dd/MM/yyyy')
//                     .format(args.value.endDate ?? args.value.startDate)
//                     .toString();
//       } else if (args.value is DateTime) {
//         _selectedDate = args.value;
//       } else if (args.value is List<DateTime>) {
//         _dateCount = args.value.length.toString();
//       } else {
//         _rangeCount = args.value.length.toString();
//       }
//     }});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: Color.fromARGB(255, 220, 218, 254),
//             borderRadius: BorderRadius.all(Radius.circular(20))),
//         height: 65,
//         width: 200,
//         child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               children: <Widget>[
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   top: 0,
//                   height: 70,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     mainAxisSize: MainAxisSize.max,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text('Selected date: '),
//                       Text('Selected date count: '),
//                       Text('Selected range: '),
//                       Text('Selected ranges count: ')
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   left: 0,
//                   top: 80,
//                   right: 0,
//                   bottom: 0,
//                   child: SfDateRangePicker(
//                     onSelectionChanged: _onSelectionChanged,
//                     selectionMode: DateRangePickerSelectionMode.range,
//                     initialSelectedRange: PickerDateRange(
//                         DateTime.now().subtract(const Duration(days: 4)),
//                         DateTime.now().add(const Duration(days: 3))),
//                   ),
//                 )
//               ],
//             )));
//   }
// }
