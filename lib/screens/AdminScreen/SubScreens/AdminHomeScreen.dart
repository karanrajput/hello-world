import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/notificationwidget.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/AdminScreen/SubScreens/Exam/Adminexampage.dart';
import 'package:bkdschool/screens/EntryScreen/EntryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          makeText("HomePage"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RButton(
                text: "Logout",
                onPressed: () {
                  BlocProvider.of<UserBloc>(context).add(UserEventLogOut());
                  Navigator.pop(context);
                  Globals.navigateScreen(EntryScreen());
                },
              ),
              RButton(
                text: "Admin Exam",
                onPressed: () {
                  Globals.navigateScreen(AdminExamPage());
                },
              ),
            ],
          ),
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
    );
  }
}
