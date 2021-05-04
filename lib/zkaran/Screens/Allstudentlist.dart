import 'package:bkdschool/zkaran/build/Addstudentpopup.dart';
import 'package:bkdschool/zkaran/build/Studentprofilecard.dart';
import 'package:flutter/material.dart';

class Allstudentlist extends StatefulWidget {
  Allstudentlist({Key key}) : super(key: key);

  @override
  _AllstudentlistState createState() => _AllstudentlistState();
}

class _AllstudentlistState extends State<Allstudentlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
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
                        "All Students",
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Studentprofilecard()),
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 70,
                right: 10,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Addstudentpopup(),
                    );
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
      ),
    );
  }
}
