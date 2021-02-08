import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/home.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var firebaseUser =  FirebaseAuth.instance.currentUser;
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
          ListTile(
            title: Text('Bookmarks'),
            onTap: () {
              Navigator.of(context).pop();
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