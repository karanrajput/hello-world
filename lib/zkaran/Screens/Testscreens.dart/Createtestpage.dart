import 'package:bkdschool/RWidgets/buttons.dart';
import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Addquestionscreen.dart';
import 'package:flutter/material.dart';
import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Testmaterial.dart';

class Createst extends StatefulWidget {
  Createst({Key key}) : super(key: key);

  @override
  _CreatestState createState() => _CreatestState();
}

enum options { op1, op2, op3, op4 }

class _CreatestState extends State<Createst> {
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
                        "Create Test",
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
                            top: 20, bottom: 150, left: 8, right: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Questions(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Questions(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Questions(),
                            ),
                            RButton(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 70,
              right: 10,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addquestion()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(200, 243, 129, 129),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    )),
              ))
        ],
      ),
    );
  }
}
// 2pin cable epson printer
// class Createtest extends StatefulWidget {
//   Createtest({Key key}) : super(key: key);

//   @override
//   _CreatetestState createState() => _CreatetestState();
// }

// class _CreatetestState extends State<Createtest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Number Registration"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             alignment: Alignment.center,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 50,
//                   ),
//                   RButton(
//                       text: "Create",
//                       textColor: Colors.black,
//                       color: Color.fromARGB(255, 220, 218, 254),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       }),
//                   Positioned(
//                       bottom: 70,
//                       right: 10,
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Addquestion()));
//                         },
//                         child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(200, 243, 129, 129),
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Icon(
//                                 Icons.add,
//                                 size: 30,
//                               ),
//                             )),
//                       ))
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
