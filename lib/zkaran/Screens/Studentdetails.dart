import 'package:flutter/material.dart';

class Studentdetails extends StatefulWidget {
  Studentdetails({Key key}) : super(key: key);

  @override
  _StudentdetailsState createState() => _StudentdetailsState();
}

class _StudentdetailsState extends State<Studentdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
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
                    "Student Details",
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
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                    child: Column(
                      children: [
                        Container(
                          width: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 100,
                                    child: ClipOval(
                                        child: Image.asset(
                                      'images/pp.png',
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 80,
                                          child: Text(
                                            "Name",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ":",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 250,
                                          child: Text(
                                            "Mr. Student",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 80,
                                          child: Text(
                                            "Roll No.",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ":",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 250,
                                          child: Text(
                                            "3290",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 80,
                                          child: Text(
                                            "Father's Name",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ":",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Mr. Father",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 80,
                                          child: Text(
                                            "Address",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ":",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 250,
                                          child: Text(
                                            "This is a very very very very long address of the " +
                                                "student of bkd school",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 80,
                                          child: Text(
                                            "Address",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ":",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 250,
                                          child: Text(
                                            "This is a very very very very long address of the " +
                                                "student of bkd school",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 80,
                                          child: Text(
                                            "Address",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ":",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 250,
                                          child: Text(
                                            "This is a very very very very long address of the " +
                                                "student of bkd school",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 80,
                                          child: Text(
                                            "Address",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ":",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 250,
                                          child: Text(
                                            "This is a very very very very long address of the " +
                                                "student of bkd school",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Padding(
//                     padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
//                     child: Container(
//                       width: 400,
//                       child: Row(
//                         children: [
//                           Stack(
//                             children: [
//                               CircleAvatar(
//                                 radius: 50,
//                                 child: ClipOval(
//                                     child: Image.asset(
//                                   'images/pp.png',
//                                   height: 100,
//                                   width: 100,
//                                   fit: BoxFit.cover,
//                                 )),
//                               ),
//                             ],
//                           ),
//                           VerticalDivider(),
//                           Column(
//                             children: [
//                               Container(
//                                 child: Text(
//                                   "Mr Harsh Dman",
//                                   style: GoogleFonts.workSans(
//                                     fontSize: 25,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 width: 250,
//                                 child: Text(
//                                   "this is very very long description notification but it looks bad",
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 2,
//                                   style: GoogleFonts.ptSans(
//                                     fontSize: 18,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                               ),
//                               Text(
//                                 "data",
//                                 style: TextStyle(fontSize: 30),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
