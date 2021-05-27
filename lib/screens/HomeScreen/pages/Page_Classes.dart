import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/notificationwidget.dart';
import 'package:bkdschool/bloc/class_bloc/class_bloc.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/EntryScreen/EntryScreen.dart';
import 'package:bkdschool/screens/HomeScreen/pages/Page_Subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesPage extends StatelessWidget {
  final List<RClass> classes = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClassBloc>(context).add(ClassEventLoadClassList());
    return RSimpleScaffold(
      title: FireRepo.instance.currentUser.name,
      actions: [
        TextButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(UserEventLogOut());
              Navigator.pop(context);
              Globals.navigateScreen(EntryScreen());
            },
            child: Text(
              "Log Out",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            )),
      ],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(child: BlocBuilder<ClassBloc, ClassState>(
          builder: (context, state) {
            if (state is ClassStateClassListLoaded) {
              classes.clear();
              classes.addAll(state.clases);
            }
            return classes.isNotEmpty
                ? _makeClassesList(context)
                : makeCenterContainer(makeLoadingIndicator("Loading..."));
          },
        )),
      ),
    );
  }

  Widget _makeClassesList(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<List<RNotification>>(
            stream: FireRepo.instance
                .getNotificationStream(who: RNotificationFor.TEACHER),
            builder: (context, snap) {
              if (!snap.hasData) {
                return makeLoadingIndicator("Loading.......");
              }
              return Container(
                constraints: BoxConstraints(
                  maxHeight: snap.data.isNotEmpty ? 150 : 0,
                ),
                child: ListView.builder(
                    itemCount: snap.data.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          RNotificationitemwidget(
                            notification: snap.data[i],
                          ),
                        ],
                      );
                    }),
              );
            }),
        Expanded(
          child: ListView.builder(
              itemCount: classes.length,
              itemBuilder: (context, index) {
                return RClassItemWidget(
                  rclass: classes[index],
                  onPressed: () async {
                    Globals.instance.currentClass = classes[index];
                    Globals.instance.subjects = await FireRepo.instance
                        .getSubjectsOfClass(classes[index]);
                    Globals.navigateScreen(SubjectsPage(
                      rclass: classes[index],
                    ));
                  },
                );
              }),
        ),
      ],
    );
  }
}
