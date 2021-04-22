import 'package:flutter/material.dart';
import 'package:bkdschool/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RScaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Hello"),
      ),
    );
  }
}
