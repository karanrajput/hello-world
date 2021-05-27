import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/services.dart';
import 'package:bkdschool/screens/HomeScreen/pages/Page_Classes.dart';
import 'package:bkdschool/screens/HomeScreen/pages/Page_Subjects.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // FireRepo.instance.getClassFromID(FireRepo.instance.currentUser.classaccess)
    //     // .getClassFromID('1ezpcfj9iT2WeXdO6S7p')
    //     .then((value) async {
    //   await ChatRepo.instance
    //       .init(await FireRepo.instance.getSubjectsOfClass(value));

    //   setState(() {
    //     rclass = value;
    //   });
    // });
    // if (FireRepo.instance.currentUser.type == RUserType.TEACHER) {
    //   isTeacher = true;
    // }
    initHome();
  }

  initHome() async {
    if (FireRepo.instance.currentUser.type == RUserType.TEACHER) {
      Globals.instance.classes = await FireRepo.instance.getClassesList();
      Globals.navigateScreen(ClassesPage(), closePrevious: true);
    } else {
      var rclass = await FireRepo.instance
          .getClassFromID(FireRepo.instance.currentUser.classaccess);
      Globals.instance.currentClass = rclass;
      Globals.instance.subjects =
          await FireRepo.instance.getSubjectsOfClass(rclass);
      Globals.navigateScreen(
          SubjectsPage(
            rclass: rclass,
          ),
          closePrevious: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "",
      child: makeCenterContainer(makeLoadingIndicator("")),
    );
  }
}
