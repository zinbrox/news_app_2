//import 'dart:html';

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
  List<String> custom = [
    'Africa',
    'Asia',
    'Australia',
    'North America',
    'South America',
    'Europe',
    'Antarctica',
    'Climate Change',
    'Covid-19',
    'E-sports',
    'F1',
    'Gaming',
    'Protest',
    'Coup',
    'Military',
    'Food',
  ];


  @override
  Widget build(BuildContext context) {
    DarkThemeProvider _themeChanger = Provider.of<DarkThemeProvider>(context);
    bool isSwitched = _themeChanger.darkTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Light Theme",
                  style: GoogleFonts.getFont("Oswald", fontSize: 25.0),
                ),
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
                Text(
                  "Dark Theme",
                  style: GoogleFonts.getFont(
                    "Oswald",
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/custom_selection');
                    },
                    child: Text("Edit Article Preferences")),
              ],
            ),
            Text("Default Country"),
            Text("Custom Notifications"),
            RaisedButton(
              child: Text("FireStore PLS DONT TOUCH"),
              onPressed: () async {
                var firebaseUser = FirebaseAuth.instance.currentUser;
                //for (var i in custom)
                /*
                  firestoreInstance
                      .collection("preferences")
                  .doc(firebaseUser.uid).update({'custom':FieldValue.arrayUnion(custom)});


                      .add({"custom": custom}).then((_) {
                    print("success!");
                  });


                   */
                //PLEASE DONT TOUCH THIS AGAIN
                  //firestoreInstance.collection("preferences").doc("keywords").update({'custom':FieldValue.arrayUnion(custom)});


                    //customTerms.remove(orderData['custom'][index]);
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
}
