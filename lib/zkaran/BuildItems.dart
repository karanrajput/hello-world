import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bkdschool/zkaran/chatscreen.dart';

class ContactItem extends StatelessWidget {
  // final FContact contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Chatscreen()),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(
                color: Colors.green[500],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Eglish Class",
                      style: GoogleFonts.mcLaren(
                        fontSize: 25,
                        letterSpacing: 1.4,
                        color: Colors.white,
                      ),
                    ),
                    // Icon(Icons.arrow_forward_ios_sharp)
                  ],
                ),
                Text(
                  "Assignment Last Date",
                  style: GoogleFonts.mcLaren(
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Color.fromARGB(250, 222, 255, 231),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  // final FContact contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(
              color: Colors.green[500],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Eglish Class",
                    style: GoogleFonts.mcLaren(
                      fontSize: 25,
                      letterSpacing: 1.4,
                      color: Colors.white,
                    ),
                  ),
                  // Icon(Icons.arrow_forward_ios_sharp)
                ],
              ),
              Text(
                "Assignment Last Date",
                style: GoogleFonts.mcLaren(
                  fontSize: 20,
                  letterSpacing: 1,
                  color: Color.fromARGB(250, 222, 255, 231),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
