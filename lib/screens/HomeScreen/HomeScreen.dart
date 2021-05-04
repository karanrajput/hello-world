import 'dart:io';

import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/class_bloc/class_bloc.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/HomeScreen/pages/Page_Classes.dart';
import 'package:bkdschool/screens/HomeScreen/pages/Page_Subjects.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_uploader/flutter_uploader.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100))
        .then((value) => Globals.navigateScreen(ClassesPage()));

    return RSimpleScaffold(
      title: "BKD School",
      child: makeCenterContainer(makeText("Home Screen")),
    );
  }
}
