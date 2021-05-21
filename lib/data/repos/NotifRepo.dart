import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifRepo {
  static final NotifRepo instance = NotifRepo._internal();
  factory NotifRepo() {
    return instance;
  }
  NotifRepo._internal();

  ///
  ///
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'MainChannel',
    'This channel is used for important notifications.',
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  showNotifications(int id, String title, String body) {
    flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channel.description,
            icon: 'launch_background',
          ),
        ));
  }
}
