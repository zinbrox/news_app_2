import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app_2/plugins/notificationsPlugin.dart';
import 'package:news_app_2/pages/article_view.dart';


class LocalNotificationsScreen extends StatefulWidget {
  @override
  _LocalNotificationsScreenState createState() =>
      _LocalNotificationsScreenState();
}

class _LocalNotificationsScreenState extends State<LocalNotificationsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    notificationPlugin.setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);

    //initializing();
  }


  /*

  Future _repeatNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeating channel id',
        'repeating channel name',
        'repeating description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.EveryMinute, platformChannelSpecifics);
  }

   */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notifications"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FlatButton(
            child: Text("Send Recurring Notification with attachment"),
            onPressed: () async {
              await notificationPlugin.showNotificationWithAttachment();
              //_showNotifications();
            },
          ),
          FlatButton(onPressed: (){
            notificationPlugin.cancelAllNotification();

          }, child: Text("Cancel Notifications"),)
        ],
      ),
    );
  }
  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {}
  Future onNotificationClick(String payload) {
    print("Pressed Notification");
    print("Payload: $payload");
    Navigator.pushNamed(context, '/article_view',arguments: ScreenArguments(payload));
  }
}
