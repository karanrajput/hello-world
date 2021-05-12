import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/screens/HomeScreen/pages/Page_Subjects.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RClass rclass;

  @override
  void initState() {
    super.initState();
    FireRepo.instance
        //.getClassFromID(FireRepo.instance.currentUser.classaccess)
        .getClassFromID('1ezpcfj9iT2WeXdO6S7p')
        .then((value) {
      setState(() {
        rclass = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "BKD School",
      child: rclass != null
          ? SubjectsPage(
              rclass: rclass,
            )
          : makeLoadingIndicator(""),
    );
  }
}
