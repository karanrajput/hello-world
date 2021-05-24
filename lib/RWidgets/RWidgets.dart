import 'dart:ui';

import 'package:bkdschool/RWidgets/misc.dart';
import 'package:flutter/material.dart';
import 'package:bkdschool/data/services/services.dart';
import 'package:google_fonts/google_fonts.dart';

export 'buttons.dart';
export 'textfields.dart';
export 'RSliderScaffold.dart';
export 'subwidgets/classwidget.dart';
export 'subwidgets/subjectwidget.dart';
export 'subwidgets/messagewidget.dart';
export 'subwidgets/userinfowidget.dart';
export 'subwidgets/subjectchatwidget.dart';

export 'misc.dart';
export 'RSliderScaffold.dart';

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
  final FloatingActionButtonLocation fabLocation;
  final Color bgColor;
  final Color color;
  final Widget bottomNavBar;

  const RSimpleScaffold(
      {Key key,
      this.title = "Title",
      this.child,
      this.actions,
      this.fab,
      this.bgColor = Colors.transparent,
      this.color = Colors.black,
      this.bottomNavBar,
      this.fabLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          foregroundColor: color,
          iconTheme: IconThemeData(color: color),
          title: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: bgColor,
          actions: actions,
        ),
        floatingActionButton: fab,
        floatingActionButtonLocation: fabLocation,
        body: child,
        bottomNavigationBar: bottomNavBar,
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
    {FontWeight weight = FontWeight.w600,
    double fontSize = 15,
    TextStyle googleFont,
    Color color = Colors.black,
    FontStyle fontStyle = FontStyle.normal,
    TextAlign alignment = TextAlign.center}) {
  return Text(
    text,
    textAlign: alignment,
    style: googleFont != null
        ? googleFont
        : GoogleFonts.poppins(
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

//
//ScrollView
//

Widget makeScroll({@required Widget child}) {
  return SingleChildScrollView(
    child: child,
    physics: BouncingScrollPhysics(),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

//
//Card Container
//

Widget makeCardContainer({
  @required Widget child,
  Color color = Colors.white,
  int alpha = 50,
  Color borderColor = Colors.black,
  int borderAlpha = 40,
  double borderWidth = 1,
  double radius = 20,
  double padding = 10,
  bool clickable = false,
  VoidCallback onPressed,
  VoidCallback onLongPressed,
}) {
  var maincontainer = Container(
    decoration: BoxDecoration(
      color: color.withAlpha(alpha),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        width: borderWidth,
        color: borderColor.withAlpha(borderAlpha),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(padding),
      child: child,
    ),
  );
  return clickable
      ? InkWell(
          splashColor: Globals.colorMain,
          borderRadius: BorderRadius.circular(radius),
          onTap: onPressed,
          onLongPress: onLongPressed,
          child: maincontainer)
      : maincontainer;
}
