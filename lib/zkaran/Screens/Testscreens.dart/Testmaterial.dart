import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Oldquestionlist.dart';
import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Studenttest.dart';
import 'package:flutter/material.dart';

class Testmatirial extends StatelessWidget {
  const Testmatirial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("data"),
        ],
      ),
    );
  }
}

class OldtestCard extends StatelessWidget {
  // final FContact contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Oldquestions()),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(150, 184, 255, 97),
              border: Border.all(color: Color.fromARGB(150, 184, 255, 97)),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chapter 1 test",
                      style: TextStyle(
                          color: Colors.black, fontFamily: "sf", fontSize: 25),
                    ),
                    VerticalDivider(),
                    Text(
                      "Held on 25/04/2021",
                      style: TextStyle(fontFamily: "sf", fontSize: 20),
                    )
                    // Icon(Icons.arrow_forward_ios_sharp)
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Score = 38/40",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "sf",
                            fontSize: 23),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Starttestcard extends StatelessWidget {
  // final FContact contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => null),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(150, 184, 255, 97),
              border: Border.all(color: Color.fromARGB(150, 184, 255, 97)),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 100,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chapter 1 test",
                      style: TextStyle(
                          color: Colors.black, fontFamily: "sf", fontSize: 25),
                    ),
                    VerticalDivider(),
                    Text(
                      "Max. Time 30 Min",
                      style: TextStyle(fontFamily: "sf", fontSize: 20),
                    ),
                    Text(
                      "Today",
                      style: TextStyle(fontFamily: "sf", fontSize: 20),
                    ),
                    // Icon(Icons.arrow_forward_ios_sharp)
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Studenttest()));
                      },
                      child: Text(
                        "Start Test",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "sf",
                            fontSize: 23),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Questions extends StatefulWidget {
  // final FContact contact;
  @override
  _QuestionsState createState() => _QuestionsState();
}

enum options { op1, op2, op3, op4 }

class _QuestionsState extends State<Questions> {
  options op = options.op1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(150, 184, 255, 97),
          border: Border.all(color: Color.fromARGB(150, 184, 255, 97)),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.859,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 8.0, right: 0, bottom: 8.0),
                child: Text(
                  "This is a very good Question everyone should answer please anser this everyone what are you doing ok give me jfk?",
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.black, fontFamily: "sf", fontSize: 25),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(50, 255, 255, 255),
                  border: Border.all(color: Color.fromARGB(150, 184, 255, 97)),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: op == options.op1
                              ? Color.fromARGB(160, 61, 132, 184)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              op = options.op1;
                            });
                          },
                          child: Text(
                            "Option 1",
                            softWrap: true,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: op == options.op2
                              ? Color.fromARGB(160, 61, 132, 184)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              op = options.op2;
                            });
                          },
                          child: Text(
                            "Option 2",
                            softWrap: true,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: op == options.op3
                              ? Color.fromARGB(160, 61, 132, 184)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              op = options.op3;
                            });
                          },
                          child: Text(
                            "Option 3",
                            softWrap: true,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: op == options.op4
                              ? Color.fromARGB(160, 61, 132, 184)
                              : Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              op = options.op4;
                            });
                          },
                          child: Text(
                            "Option 4",
                            softWrap: true,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Message extends StatelessWidget {
//   final FContact contact;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Colors.green,
//             border: Border.all(
//               color: Colors.green[500],
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(20))),
//         height: 100,
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Eglish Class",
//                     style: TextStyle(
//                       fontSize: 25,
//                       letterSpacing: 1.4,
//                       color: Colors.white,
//                     ),
//                   ),
//                   // Icon(Icons.arrow_forward_ios_sharp)
//                 ],
//               ),
//               Text(
//                 "Assignment Last Date",
//                 style: TextStyle(
//                   fontSize: 20,
//                   letterSpacing: 1,
//                   color: Color.fromARGB(250, 222, 255, 231),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
