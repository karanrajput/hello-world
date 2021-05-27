import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/RWidgets/subwidgets/notificationwidget.dart';
import 'package:bkdschool/bloc/user_bloc/user_bloc.dart';
import 'package:bkdschool/data/models/ClassModel.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/models/SubjectModel.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/ChatRepo.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/ChatScreen/ChatScreen.dart';
import 'package:bkdschool/screens/EntryScreen/EntryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatefulWidget {
  final RClass rclass;

  const SubjectsPage({Key key, this.rclass}) : super(key: key);

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  @override
  void initState() {
    super.initState();
    ChatRepo.instance.init(Globals.instance.subjects).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RSimpleScaffold(
      title: "Subjects",
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
            ))
      ],
      child: Column(
        children: [
          FireRepo.instance.currentUser.type == RUserType.TEACHER
              ? Container()
              : StreamBuilder<List<RNotification>>(
                  stream: FireRepo.instance
                      .getNotificationStream(who: RNotificationFor.STUDENT),
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
            child: Container(
                child: _makeSubjectsList(context, Globals.instance.subjects)),
          ),
        ],
      ),
    );
  }

  Widget _makeSubjectsList(BuildContext context, List<RSubject> subjects) {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (contextn, index) {
          return RSubjectChatItemWidget(
            subject: subjects[index],
            onPressed: () {
              Globals.navigateScreen(ChatScreen(
                subject: subjects[index],
              ));
            },
          );
        });
  }
}
