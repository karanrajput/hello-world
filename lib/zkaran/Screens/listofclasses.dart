import 'package:bkdschool/zkaran/Screens/allclasslist.dart';
import 'package:bkdschool/zkaran/build/Addstudentpopup.dart';
import 'package:flutter/material.dart';

class Studentclasslistscreen extends StatefulWidget {
  Studentclasslistscreen({Key key}) : super(key: key);

  @override
  _StudentclasslistscreenState createState() => _StudentclasslistscreenState();
}

class _StudentclasslistscreenState extends State<Studentclasslistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Addstudentpopup(),
          );
        },
        child: const Icon(Icons.add),
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
                    "Student In Class",
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
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Allclasslist(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
