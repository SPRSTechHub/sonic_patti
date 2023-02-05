import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin _notiPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initialSettings = InitializationSettings(
      android: AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      ),
    );
    _notiPlugin.initialize(initialSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) {
      print('onDidReceiveNotificationResponse Function');
      print(details.payload);
      print(details.payload != null);
    });
  }

  static void showNotification(RemoteMessage message) {
    final NotificationDetails notiDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'sonic_gmx',
        'sonic_gmx_channel',
        importance: Importance.max,
        priority: Priority.high,
        sound: RawResourceAndroidNotificationSound('alertnotify'),
        enableVibration: true,
        playSound: true,
      ),
    );
    _notiPlugin.show(
      DateTime.now().microsecond,
      message.notification!.title,
      message.notification!.body,
      notiDetails,
      payload: message.data.toString(),
    );
  }

  /*static void initialize(BuildContext context) {
    const InitializationSettings initialSettings = InitializationSettings(
      android: AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      ),
    );
    _notiPlugin.initialize(initialSettings,
        onDidReceiveNotificationResponse: (NotificationResponse details) {},
        onDidReceiveBackgroundNotificationResponse:
            (NotificationResponse details) {});
  }

  static void showNotification(RemoteMessage message) async {
    const NotificationDetails notiDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'sonic_gmx',
        'sonic_gmx_channel',
        importance: Importance.max,
        priority: Priority.high,
        sound: RawResourceAndroidNotificationSound('alertnotify'),
        enableVibration: true,
        playSound: true,
      ),
    );
    _notiPlugin.show(
      DateTime.now().microsecond,
      message.notification!.title,
      message.notification!.body,
      notiDetails,
      payload: message.data.toString(),
    );
  }
*/
}
