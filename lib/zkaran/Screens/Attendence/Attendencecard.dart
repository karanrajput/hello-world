import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Attendencecard extends StatefulWidget {
  const Attendencecard({Key key}) : super(key: key);

  @override
  _AttendencecardState createState() => _AttendencecardState();
}

enum options { op1, op2 }

class _AttendencecardState extends State<Attendencecard> {
  bool presenttoggle = false;
  bool absenttoggle = false;

  options op;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      color: Color.fromARGB(100, 234, 255, 208),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
            VerticalDivider(),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 220,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        "Student Name",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
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
                        "Roll No. - 0368",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      presenttoggle = !presenttoggle;
                      absenttoggle = !presenttoggle;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color:
                            presenttoggle ? Colors.green : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      child: Text(
                        "Present",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      absenttoggle = !absenttoggle;
                      presenttoggle = !absenttoggle;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: absenttoggle ? Colors.red : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 8, bottom: 8),
                      child: Text(
                        "Absent",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
