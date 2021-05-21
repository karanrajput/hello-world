import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/repos/NotifRepo.dart';
import 'package:bkdschool/data/services/services.dart';
import 'package:bkdschool/screens/EntryScreen/EntryScreen.dart';
import 'package:bkdschool/screens/HomeScreen/pages/Page_Subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        .then((value) async {
      await ChatRepo.instance
          .init(await FireRepo.instance.getSubjectsOfClass(value));

      setState(() {
        rclass = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "BKD School",
      actions: [
        RButton(
          text: "Logout",
          onPressed: () {
            BlocProvider.of<UserBloc>(context).add(UserEventLogOut());
            Navigator.pop(context);
            Globals.navigateScreen(EntryScreen());
          },
        )
      ],
      child: rclass != null
          ? SubjectsPage(
              rclass: rclass,
            )
          : makeLoadingIndicator(""),
    );
  }
}
