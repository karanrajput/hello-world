import 'dart:ui';

import 'package:bkdschool/zkaran/Screens/Teacherdetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Teacherprofilecard extends StatelessWidget {
  final String text;
  final String description;

  const Teacherprofilecard(
      {this.text = "Mr Person", this.description = "person@mail.com"});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      color: Color.fromARGB(100, 234, 255, 208),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                      child: Image.asset(
                    'images/pp.png',
                    height: 60,
                    fit: BoxFit.cover,
                  )),
                ),
              ],
            ),
            VerticalDivider(),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 220,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.ptSans(
                          fontSize: 22,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 230,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.ptSans(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Teacherdetails()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "View",
                    style: TextStyle(fontSize: 18),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
