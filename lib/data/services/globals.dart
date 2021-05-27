import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/services/services.dart';
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
  static const Color colorMain = Color(0xFFF23D3D);
  static const Color colorSecondary = Colors.pink;

  ///////////////////
  ///
  ///
  ///

  List<RClass> classes;
  List<RSubject> subjects;
  RSubject currentSubject;
  RClass currentClass;

  ///
  ///
  ///
  ///
  ///

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

  //Popup
  static makeRPopup(Widget popup, String tag) async {
    return await navigation.currentState.push(RPopupPageRoute(builder: (c) {
      return Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32, 32, 32,
              MediaQuery.of(navigation.currentContext).viewInsets.bottom + 16),
          child: Hero(tag: tag, child: popup),
        ),
      );
    }));
  }
}
