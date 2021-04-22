import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class profilecard extends StatefulWidget {
  profilecard({Key key}) : super(key: key);

  @override
  _profilecardState createState() => _profilecardState();
}

class _profilecardState extends State<profilecard> {
  final imagepicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 70,
                child: ClipOval(
                    child: Image.asset(
                  'images/pp.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                )),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: InkWell(
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  )),
            ],
          ),
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
          )
        ],
      ),
    );
  }
}
