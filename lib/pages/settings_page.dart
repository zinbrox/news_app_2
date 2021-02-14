//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/plugins/notificationsPlugin.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app_2/pages/home.dart';


class Settings_Page extends StatefulWidget {
  @override
  _Settings_PageState createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {
  bool isSwitched;
  final firestoreInstance = FirebaseFirestore.instance;
  getNotificationsSwitch() async{
    final prefs = await SharedPreferences.getInstance();
    var x = prefs.getBool('notificationsSwitch') ?? null;
    if(x==null)
      isSwitched = false;
    else
      isSwitched = x;
  }

  void initState() {
    super.initState();
    print("In initState() of Settings Page");
    getNotificationsSwitch();
    setState(() {

    });
    notificationPlugin.setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: GoogleFonts.getFont("Oswald", fontSize: 20),),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications", style: GoogleFonts.getFont("Oswald", fontSize: 20),),
                Switch(
                  value: isSwitched,
                  onChanged: (value) async {
                    setState(() {
                      isSwitched = value;
                    });
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('notificationsSwitch', isSwitched);
                    isSwitched ? await notificationPlugin.showNotificationWithAttachment() : notificationPlugin.cancelAllNotification();
                  },
                  activeColor: Colors.deepPurple,
                  activeTrackColor: Colors.purpleAccent[400],
                ),
              ],
            ),

            Text("Custom Notifications"),
            RaisedButton(
              child: Text("FireStore PLS DONT TOUCH"),
              onPressed: () async {
                var firebaseUser = FirebaseAuth.instance.currentUser;
                print(firebaseUser.uid);
                DocumentSnapshot variable = await firestoreInstance.collection("userPreferences").doc(firebaseUser.uid).get();
                  print(variable['custom']);

                    firestoreInstance
                        .collection('userPreferences')
                        .doc(firebaseUser.uid)
                        .update({
                      "custom": FieldValue.arrayUnion(
                          ['another test'])
                    });
                    //customTerms.add(orderData['custom'][index]);

                  /*
                  firestoreInstance.collection("test").get().then((querySnapshot) {
                    querySnapshot.docs.forEach((result) {
                      print(result.data()['custom']);
                    });
                  });

                   */
              },
            ),
            /*
            FlatButton(
              child: Text("Light Theme"),
              onPressed: () => _themeChanger.darkTheme = false,
            ),
            FlatButton(
                child: Text("Dark Theme"),
                onPressed: () => _themeChanger.darkTheme = true),
            */
          ],
        ),
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
