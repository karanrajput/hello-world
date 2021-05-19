import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/notificationwidget.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/AdminScreen/SubScreens/Exam/Admincreateexam.dart';
import 'package:bkdschool/screens/EntryScreen/EntryScreen.dart';
import 'package:bkdschool/zkaran/Screens/Testscreens.dart/Testpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminExamPage extends StatefulWidget {
  @override
  _AdminExamPageState createState() => _AdminExamPageState();
}

class _AdminExamPageState extends State<AdminExamPage> {
  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      fab: FloatingActionButton(
        onPressed: () {
          Globals.navigateScreen(AdminCreateExamPage());
        },
        child: Icon(Icons.add),
      ),
      title: "Exam Page",
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: StreamBuilder<List<RNotification>>(
                  stream: FireRepo.instance.getNotificationStream(),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      return makeLoadingIndicator("Loading.......");
                    }
                    return ListView.builder(
                        itemCount: snap.data.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              RNotificationitemwidget(
                                notification: snap.data[i],
                              ),
                            ],
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
