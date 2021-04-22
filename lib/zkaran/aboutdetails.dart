import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Aboutdetails extends StatefulWidget {
  Aboutdetails({Key key}) : super(key: key);

  @override
  _AboutdetailsState createState() => _AboutdetailsState();
}

class _AboutdetailsState extends State<Aboutdetails> {
  final imagepicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(children: [
        Container(
          child: Text("About Me"),
        ),
        Container(
          child: ClipPath(
              child: Image.asset(
            'images/pp.png',
            height: 200,
            fit: BoxFit.cover,
          )),
        ),
        Column(
          children: [
            Container(
              child: Text(
                "Mr Harsh Dman",
                style: GoogleFonts.workSans(
                  fontSize: 25,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
              child: Text(
                "this is very very long description notification but it looks bad",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: GoogleFonts.ptSans(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
