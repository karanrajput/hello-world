import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilecard extends StatelessWidget {
  final String text;
  final String mail;

  const Profilecard({this.text = "Mr Person", this.mail = "person@mail.com"});

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
              text,
              style: GoogleFonts.workSans(
                fontSize: 25,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            child: Text(
              mail,
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
