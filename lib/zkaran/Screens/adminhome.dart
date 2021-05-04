import 'package:flutter/material.dart';

class Adminhome extends StatefulWidget {
  Adminhome({Key key}) : super(key: key);

  @override
  _AdminhomeState createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
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
                pinned: true,
                floating: false,
                backgroundColor: Colors.transparent,
                expandedHeight: 160.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "BKD School",
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
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "data",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "data",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "data",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "data",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "data",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(
                          "data",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(
                          "data",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(
                          "data last",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
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
