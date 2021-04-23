import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "Make Bot",
      child: makeCenterContainer(makeText("Hello")),
    );
  }
}
