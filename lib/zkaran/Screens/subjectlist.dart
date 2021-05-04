import 'package:bkdschool/zkaran/BuildItems.dart';

import 'package:bkdschool/zkaran/build/addsubjectpopup.dart';
import 'package:flutter/material.dart';

class Subjectlist extends StatelessWidget {
  const Subjectlist({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Addsubjectpopup(),
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
                    "Class Subject",
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
                        GroupItem(),
                        GroupItem(),
                        GroupItem(),
                        GroupItem(),
                        SizedBox(
                          height: 50,
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
    ));
  }
}
