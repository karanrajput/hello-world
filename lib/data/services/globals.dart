import 'package:flutter/material.dart';

class Globals {
  static final Globals instance = new Globals._internal();
  factory Globals() {
    return instance;
  }
  Globals._internal();

  ///////////////////
  //Data
  //
  //Static Strings
  //
  static String appName = "School Management System";

  //
  //Colors
  //
  static Color colorMain = Colors.teal;
  static Color colorSecondary = Colors.pink;

  ///////////////////

  //Navigation
  static final navigation = GlobalKey<NavigatorState>();
  static Future<dynamic> navigateScreen(Widget screen,
      {bool closePrevious = false}) {
    if (closePrevious) {
      return navigation.currentState.pushAndRemoveUntil(
          MaterialPageRoute(builder: (b) => screen), (route) => false);
    } else {
      return navigation.currentState
          .push(MaterialPageRoute(builder: (b) => screen));
    }
  }

  //Snackbar
  static showSnackbar(BuildContext context, String message,
      {Color bgcolor = Colors.black45, TextStyle style}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message, style: style), backgroundColor: bgcolor));
  }
}
