//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news_app_2/pages/home.dart';

/*
class ListItem {
  String code;
  String country;

  ListItem(this.code, this.country);
}
List<ListItem> _dropdownItems = [
  ListItem("in", "India"),
  ListItem("ar", "Argentina"),
  ListItem("at", "Austria"),
  ListItem("de", "Germany"),
  ListItem("en", "Third Item"),
  ListItem("us", "Fourth Item"),
  ListItem("ae", "U.A.E."),
];
String hello="Hello";

 */

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
  /*
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.country),
          value: listItem,
        ),
      );
    }
    return items;
  }

  getStringValuesSF() async {
    print("In getStringValuesSF");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = await prefs.getString('defaultCountryCode') ?? null;
    int index;
    for(var i in _dropdownMenuItems)
      if(i.value.code == stringValue){
        index = _dropdownMenuItems.indexOf(i);
        break;
      }
    print(stringValue);
    _selectedItem = stringValue==null ?  _dropdownMenuItems[0].value : _dropdownMenuItems[index].value;
    setState(() {
    });
  }

   */

  void initState() {
    super.initState();
    //_dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    print("In initState() of Settings Page");
    //getStringValuesSF();
    print("Back in initState()");
    setState(() {

    });
  }
  //List<String> defaultCountry = ["France","Germany","India","Italy"];
  //String dropdownValue;


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
            /*
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Default Country"),
                DropdownButton<ListItem>(
                  value: _selectedItem,
                  onChanged: (value){
                    setState((){
                      _selectedItem = value;
                      print(_selectedItem.code);
                      print(_selectedItem.country);
                      addStringToSF();
                    });
                  },
                  items: _dropdownMenuItems,
                ),
              ],
            ),
            */
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
  /*
  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("defaultCountryCode", _selectedItem.code);
    prefs.setString("defaultCountry", _selectedItem.country);
  }

   */
}
