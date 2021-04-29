import 'package:bkdschool/zkaran/build/Classcardforgrid.dart';
import 'package:flutter/material.dart';

class Allclasslist extends StatefulWidget {
  Allclasslist({Key key}) : super(key: key);

  @override
  _AllclasslistState createState() => _AllclasslistState();
}

class _AllclasslistState extends State<Allclasslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "All Classes",
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
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            Classescard(
                              text: "LKG",
                              students: 54,
                            ),
                            Classescard(
                              text: "UKG",
                              students: 89,
                            ),
                            Classescard(
                              text: "1st",
                              students: 36,
                            ),
                            Classescard(
                              text: "2nd",
                              students: 45,
                            ),
                            Classescard(
                              text: "3rd",
                              students: 64,
                            ),
                            Classescard(
                              text: "4th",
                              students: 45,
                            ),
                            Classescard(
                              text: "5th",
                              students: 26,
                            ),
                            Classescard(
                              text: "6th",
                              students: 54,
                            ),
                            Classescard(
                              text: "7th",
                              students: 39,
                            ),
                            Classescard(
                              text: "8th",
                              students: 54,
                            ),
                            Classescard(
                              text: "9th",
                              students: 49,
                            ),
                            Classescard(
                              text: "10th",
                              students: 27,
                            ),
                            Classescard(
                              text: "11th",
                              students: 67,
                            ),
                            Classescard(
                              text: "12th",
                              students: 59,
                            ),
                          ],
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
