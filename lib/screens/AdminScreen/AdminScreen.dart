import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/AdminScreen/SubScreens/AdminClassScreen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "Admin Panel",
      child: Column(
        children: [
          RButton(
            text: "Classes",
            onPressed: () {
              Globals.navigateScreen(AdminClassScreen());
            },
          ),
          RButton(
            text: "Teachers",
          ),
          RButton(
            text: "Students",
          ),
          RButton(
            text: "Notice",
          ),
        ],
      ),
    );
  }
}
