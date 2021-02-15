import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/plugins/notificationsPlugin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool notificationsSwitch=true;
  int count;

  getNotificationsSwitch() async{
    final prefs = await SharedPreferences.getInstance();
    var x = prefs.getBool('notificationsSwitch') ?? null;
    notificationsSwitch = x==null ? true : x;
    setState(() {

    });
  }

  void initState() {
    super.initState();
    print("In initState() of Drawer Page");
    count=0;
    getNotificationsSwitch();
    print(notificationsSwitch);
    notificationPlugin.setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);
    setState(() {
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    DarkThemeProvider _themeChanger = Provider.of<DarkThemeProvider>(context);
    bool isSwitched = _themeChanger.darkTheme;
    String dropdownValue;
    isSwitched ? dropdownValue = 'Dark' : dropdownValue = 'Light';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Posit News',
                    style: GoogleFonts.getFont("Oswald", fontSize: 50.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: (){
                      print("Tapped Name");
                      count++;
                      if(count==10){
                        count=0;
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, '/easterEgg');
                      }

                    },
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text(firebaseUser.displayName,
                            style: GoogleFonts.getFont("Oswald", fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Theme", style: GoogleFonts.getFont("Oswald", fontSize: 20),),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String newValue){
                    setState((){
                      dropdownValue = newValue;
                      newValue=='Dark' ? _themeChanger.darkTheme=true : _themeChanger.darkTheme=false;
                    });
                  },
                  items: <String>['Light','Dark'].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(value: value, child: Text(value),);
                  }).toList(),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications", style: GoogleFonts.getFont("Oswald", fontSize: 20),),
                Switch(
                  value: notificationsSwitch,
                  onChanged: (value) async {
                    setState(() {
                      notificationsSwitch = value;
                    });
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('notificationsSwitch', notificationsSwitch);
                    notificationsSwitch ? await notificationPlugin.showNotificationWithAttachment() : notificationPlugin.cancelAllNotification();
                  },
                  activeColor: Colors.deepPurple,
                  activeTrackColor: Colors.purpleAccent[400],
                ),
              ],
            ),
          ),



          ListTile(
            title: Text('Edit Preferences', style: GoogleFonts.getFont("Oswald", fontSize: 20),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/custom_selection');
            },
          ),
          ListTile(
            title: Text('Settings', style: GoogleFonts.getFont("Oswald", fontSize: 20),),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            title: Text('Feedback and Help', style: GoogleFonts.getFont("Oswald", fontSize: 20),),
            onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/feedback');
            },
          ),
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