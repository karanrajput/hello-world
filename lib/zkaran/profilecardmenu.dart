import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class profilecardmenu extends StatefulWidget {
  profilecardmenu({Key key}) : super(key: key);

  @override
  _profilecardmenuState createState() => _profilecardmenuState();
}

class _profilecardmenuState extends State<profilecardmenu> {
  final imagepicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                child: ClipOval(
                    child: Image.asset(
                  'images/pp.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                )),
              ),
            ],
          ),
          VerticalDivider(),
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
                  "harsh@dman.com",
                  style: GoogleFonts.ptSans(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => null,
            child: Icon(
              Icons.arrow_drop_down,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
