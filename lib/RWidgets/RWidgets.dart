import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bkdschool/data/services/services.dart';

export 'buttons.dart';
export 'textfields.dart';
export 'RSliderScaffold.dart';
export 'subwidgets/classwidget.dart';
export 'subwidgets/subjectwidget.dart';

//Old RScaffold
Widget rScaffold(
    {String title = "Title",
    @required Widget child,
    List<Widget> actions,
    Widget fab,
    List<Padding> children}) {
  return Scaffold(
    floatingActionButton: fab,
    appBar: AppBar(
      title: Text(title),
      actions: actions,
    ),
    body: child,
  );
}

//Simple RScaffold
//
class RSimpleScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> actions;
  final Widget fab;
  final Color bgColor;
  final Color color;

  const RSimpleScaffold(
      {Key key,
      this.title = "Title",
      this.child,
      this.actions,
      this.fab,
      this.bgColor = Globals.colorMain,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: color,
          title: Text(
            title,
            style: TextStyle(color: color),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: bgColor,
          actions: actions,
        ),
        floatingActionButton: fab,
        body: child,
      ),
    );
  }
}

//Simple Loading Indicator
//
Widget makeLoadingIndicator(String message) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularProgressIndicator(),
      SizedBox(
        height: 20,
      ),
      Text(
        message,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
      ),
    ],
  );
}

//Simple Text with options
//
Widget makeText(String text,
    {FontWeight weight = FontWeight.normal,
    double fontSize = 15,
    Color color = Colors.black,
    FontStyle fontStyle = FontStyle.normal,
    TextAlign alignment = TextAlign.center}) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: fontSize,
        fontStyle: fontStyle),
  );
}

//Simple IconText
//
Widget makeIconText(String message, IconData icon,
    {Color color = Colors.red, double size = 60}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: size,
        color: color,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        message,
        style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    ],
  );
}

//SimpleCenterContainer
//
Widget makeCenterContainer(Widget child) {
  return Container(
    alignment: Alignment.center,
    child: child,
  );
}

//
//Spacer
Widget makeSpace(double space, [bool width = false]) {
  return width
      ? SizedBox(
          width: space,
        )
      : SizedBox(
          height: space,
        );
}
