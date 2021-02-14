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
