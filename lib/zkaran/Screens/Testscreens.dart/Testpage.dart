import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Createtestpage.dart';
import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Testmaterial.dart';

import 'package:flutter/material.dart';

class Testpage extends StatefulWidget {
  Testpage({Key key}) : super(key: key);

  @override
  _TestpageState createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
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
                        "Test Page",
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
                            padding: const EdgeInsets.all(8.0),
                            child: OldtestCard(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Starttestcard(),
                          ),
                        ],
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
                      MaterialPageRoute(builder: (context) => Createst()));
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
