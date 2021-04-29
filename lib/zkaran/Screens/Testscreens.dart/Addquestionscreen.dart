import 'package:bkdschool/zkaran/buttons.dart';
import 'package:flutter/material.dart';

class Addquestion extends StatefulWidget {
  Addquestion({Key key}) : super(key: key);

  @override
  _AddquestionState createState() => _AddquestionState();
}

enum options { op1, op2, op3, op4 }

class _AddquestionState extends State<Addquestion> {
  options op = options.op1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/g.png"),
                fit: BoxFit.cover,
              )),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                    shadowColor: Colors.transparent,
                    excludeHeaderSemantics: true,
                    pinned: false,
                    floating: false,
                    backgroundColor: Colors.transparent,
                    expandedHeight: 160.0,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        "Add Question",
                        style: TextStyle(fontSize: 30, color: Colors.black87),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 10, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color.fromARGB(255, 220, 218, 254),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 10),
                                child: Column(
                                  children: [
                                    TextField(
                                      minLines: 1,
                                      maxLines: 5,
                                      keyboardType: TextInputType.multiline,
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Enter Your Question",
                                        labelText: "Question",
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            minLines: 1,
                                            maxLines: 5,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: TextStyle(
                                              fontSize: 30,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "Enter Option 1",
                                              labelText: "Option 1",
                                            ),
                                          ),
                                        ),
                                        Radio(
                                          onChanged: (value) {
                                            setState(() {
                                              op = value;
                                            });
                                          },
                                          groupValue: op,
                                          value: options.op1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            minLines: 1,
                                            maxLines: 5,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: TextStyle(
                                              fontSize: 30,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "Enter Option 2",
                                              labelText: "Option 2",
                                            ),
                                          ),
                                        ),
                                        Radio(
                                          onChanged: (value) {
                                            setState(() {
                                              op = value;
                                            });
                                          },
                                          groupValue: op,
                                          value: options.op2,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            minLines: 1,
                                            maxLines: 5,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: TextStyle(
                                              fontSize: 30,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "Enter Option 3",
                                              labelText: "Option 3",
                                            ),
                                          ),
                                        ),
                                        Radio(
                                          onChanged: (value) {
                                            setState(() {
                                              op = value;
                                            });
                                          },
                                          groupValue: op,
                                          value: options.op3,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            minLines: 1,
                                            maxLines: 5,
                                            keyboardType:
                                                TextInputType.multiline,
                                            style: TextStyle(
                                              fontSize: 30,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "Enter Option 4",
                                              labelText: "Option 4",
                                            ),
                                          ),
                                        ),
                                        Radio(
                                          onChanged: (value) {
                                            setState(() {
                                              op = value;
                                            });
                                          },
                                          groupValue: op,
                                          value: options.op4,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RButton(
                                          text: "Submit",
                                          color: Colors.blueAccent,
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                    ),
                                    SizedBox(
                                      height: 80,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class Addquestion extends StatefulWidget {
//   Addquestion({Key key}) : super(key: key);

//   @override
//   _AddquestionState createState() => _AddquestionState();
// }

// class _AddquestionState extends State<Addquestion> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Container(
//           child: Stack(
//             alignment: Alignment.center,
//             // ignore: deprecated_member_use
//             overflow: Overflow.visible,
//             children: <Widget>[
//               Positioned(
//                 right: -40.0,
//                 top: -40.0,
//                 child: InkResponse(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: CircleAvatar(
//                     child: Icon(Icons.close, color: Colors.black),
//                     backgroundColor: Colors.white30,
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   color: Color.fromARGB(255, 220, 218, 254),
//                 ),
//                 child: Column(
//                   children: [
//                     Rtextfield(
//                       labeltext: "Name",
//                       hinttext: "Teacher Name",
//                       textColor: Colors.black,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: RButton(
//                           text: "Submit",
//                           color: Colors.blueAccent,
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
