import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'Pages/AdminAddTeacherPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminTeacherScreen extends StatefulWidget {
  @override
  _AdminTeacherScreenState createState() => _AdminTeacherScreenState();
}

class _AdminTeacherScreenState extends State<AdminTeacherScreen> {
  final searchController = TextEditingController();

  _onItemClick(RUser ruser) {
    Globals.makeRPopup(
      AdminAddTeacherPage(
        ruser: ruser,
      ),
      '',
    );
  }

  _onTextChange(String value) {
    var text = value.toLowerCase();
    displayList.clear();
    rusers.forEach((element) {
      if (element.name.toLowerCase().contains(text) ||
          element.rollno.toLowerCase().contains(text) ||
          element.username.toLowerCase().contains(text) ||
          element.contactnumber.toLowerCase().contains(text)) {
        displayList.add(element);
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    FireRepo.instance.getAllUsersStream(RUserType.TEACHER).listen((event) {
      rusers = event;
      displayList.addAll(rusers);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: makeCardContainer(
        padding: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: RTextField(
                controller: searchController,
                icon: Icon(Icons.search),
                label: null,
                hint: "search...",
                onChanged: _onTextChange,
              ),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, conts) {
                if (displayList.isNotEmpty) {
                  return _makeStudentList(context, displayList);
                } else if (displayList.isEmpty && rusers.isNotEmpty) {
                  return makeCenterContainer(makeIconText(
                      "Nothing here", FontAwesomeIcons.mehBlank,
                      color: Colors.black));
                } else if (rusers.isEmpty) {
                  return makeCenterContainer(makeIconText(
                      "Nothing here", FontAwesomeIcons.mehBlank,
                      color: Colors.black));
                } else {
                  return makeCenterContainer(makeLoadingIndicator(""));
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  List<RUser> rusers = [];
  List<RUser> displayList = [];

  Widget _makeStudentList(BuildContext context, List<RUser> users) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: users.length,
      separatorBuilder: (context, i) {
        return Divider();
      },
      itemBuilder: (context, i) {
        return RUserInfoItemWidget(
          ruser: users[i],
          onPressed: () => _onItemClick(users[i]),
          onCallPressed: () {
            launch("tel://" + users[i].contactnumber);
          },
        );
      },
    );
  }
}
