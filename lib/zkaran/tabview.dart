import 'dart:ui';

import 'package:flat_segmented_control/flat_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Tabview extends StatefulWidget {
  Tabview({Key key}) : super(key: key);

  @override
  _TabviewState createState() => _TabviewState();
}

class _TabviewState extends State<Tabview> {
  final imagepicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatSegmentedControl(
        isChildrenSwipeable: true,
        tabChildren: <Widget>[
          Container(
            height: 50.0,
            child: Center(child: Text("Tab 1")),
          ),
          Container(
            height: 50.0,
            child: Center(child: Text("Tab 2")),
          ),
          Container(
            height: 50.0,
            child: Center(child: Text("Tab 3")),
          ),
        ],
        childrenHeight: 150.0,
        children: <Widget>[
          Center(child: Text("View 1")),
          Center(child: Text("View 2")),
          Center(child: Text("View 3")),
        ],
      ),
    );
  }
}
