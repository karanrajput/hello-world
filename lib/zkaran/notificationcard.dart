import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Notificationcard extends StatefulWidget {
  Notificationcard({Key key}) : super(key: key);

  @override
  _NotificationcardState createState() => _NotificationcardState();
}

class _NotificationcardState extends State<Notificationcard> {
  final imagepicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
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
                width: 200,
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
        ],
      ),
    );
  }
}
