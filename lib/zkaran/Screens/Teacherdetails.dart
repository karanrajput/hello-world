import 'package:bkdschool/zkaran/Screens/popupalert.dart';
import 'package:flutter/material.dart';

class Teacherdetails extends StatefulWidget {
  Teacherdetails({Key key}) : super(key: key);

  @override
  _TeacherdetailsState createState() => _TeacherdetailsState();
}

class _TeacherdetailsState extends State<Teacherdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Teacherpopupalert(),
          );
        },
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
                    "Teacher Details",
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
                                            "Mr. Teacher",
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
                                            "ID No.",
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
