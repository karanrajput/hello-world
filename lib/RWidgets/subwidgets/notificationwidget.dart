import 'package:bkdschool/RWidgets/RWidgets.dart';
import 'package:bkdschool/data/models/NotificationModel.dart';
import 'package:bkdschool/data/services/globals.dart';
import 'package:bkdschool/screens/AdminScreen/SubScreens/Pages/AdminAddEvent.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RNotificationitemwidget extends StatelessWidget {
  RNotificationitemwidget({Key key, this.notification}) : super(key: key);
  final RNotification notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: makeCardContainer(
            padding: 0,
            alpha: 80,
            color: Colors.white,
            clickable: true,
            onPressed: () {
              Globals.makeRPopup(
                  AdminAddEvent(
                    editevent: true,
                    notification: notification,
                  ),
                  "");
            },
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(150),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: makeText(
                        "Notification For " +
                            (notification.forstudent & notification.forteacher
                                ? "Both"
                                : notification.forteacher
                                    ? "Teacher"
                                    : notification.forstudent
                                        ? "Student"
                                        : "None"),
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 4, top: 8, bottom: 8),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        makeText(notification.heading,
                            fontSize: 25, alignment: TextAlign.left),
                        makeText(
                          notification.description,
                          fontSize: 20,
                          alignment: TextAlign.left,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(150),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: makeText("End Date " +
                        DateFormat("dd MMM yyyy")
                            .format(notification.lastdate)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
