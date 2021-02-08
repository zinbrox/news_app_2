import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Settings_Page extends StatefulWidget {
  @override
  _Settings_PageState createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    DarkThemeProvider _themeChanger = Provider.of<DarkThemeProvider>(context);
    bool isSwitched = _themeChanger.darkTheme;
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Light Theme", style: GoogleFonts.getFont("Oswald", fontSize: 25.0),),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    value == false
                        ? _themeChanger.darkTheme = false
                        : _themeChanger.darkTheme = true;
                  });
                },
                activeColor: Colors.deepPurple,
                activeTrackColor: Colors.purpleAccent[400],
              ),
              Text("Dark Theme", style: GoogleFonts.getFont("Oswald", fontSize: 25.0,),),
            ],
          ),
          RaisedButton(
            child: Text("FireStore"),
            onPressed: (){
              var firebaseUser =  FirebaseAuth.instance.currentUser;
              firestoreInstance.collection("users").doc(firebaseUser.uid).set(
                  {
                    "name" : "john",
                    "age" : 50,
                    "email" : "example@example.com",
                    "address" : {
                      "street" : "street 24",
                      "city" : "new york"
                    }
                  }).then((_){
                print("success!");
              });
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
    );
  }
}
