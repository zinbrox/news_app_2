import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
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
                  child: Text(firebaseUser.displayName,
                      style: GoogleFonts.getFont("Oswald", fontSize: 30.0),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Theme"),
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
          ListTile(
            title: Text('Edit Preferences'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/custom_selection');
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            title: Text('Feedback and Help'),
            onTap: () {
            Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}