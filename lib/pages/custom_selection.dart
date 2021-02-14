import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Custom_Selection extends StatefulWidget {
  @override
  _Custom_SelectionState createState() => _Custom_SelectionState();
}

class _Custom_SelectionState extends State<Custom_Selection> {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  List<String> customList = new List<String>();
  bool _loading=true;




  void getCustomKeywords() async{
    final prefs = await SharedPreferences.getInstance();
    var x = prefs.getStringList('customKeywords') ?? null;
    if(x == null) {
      prefs.setStringList('customKeywords', customList);
      print("CUSTOMLIST");
    }
    else
      customList = x;
  }

  @override
  void initState() {
    print("In initState() of Custom_Selection");
    super.initState();

    getCustomKeywords();
    print(customList);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider _themeChanger = Provider.of<DarkThemeProvider>(context);
    bool isDark = _themeChanger.darkTheme;
    return _loading ? CircularProgressIndicator()
        : Scaffold(
      appBar: AppBar(
        title: Text("Preferences"),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder(
        stream: firestoreInstance.collection("preferences").doc("keywords").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData)
            return CircularProgressIndicator();
          else
          return GridView.builder(
            padding: EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 4.0, crossAxisSpacing: 4.0),
              itemCount: snapshot.data['custom'].length,
              itemBuilder: (BuildContext context, int index) {
                var orderData = snapshot.data;
                return GestureDetector(
                  onTap: () async {

                    print(customList);

                    final prefs = await SharedPreferences.getInstance();
                    if(customList.contains(orderData['custom'][index])) {
                      customList.remove(orderData['custom'][index]);
                      prefs.remove('customKeywords');
                      prefs.setStringList('customKeywords', customList);
                    }
                    else {
                      customList.add(orderData['custom'][index]);
                      prefs.remove('customKeywords');
                      prefs.setStringList('customKeywords', customList);
                    }

                    setState(() {

                    });
                  },
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 30),
                    color: isDark ? Colors.grey[900] : Colors.grey[400],
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Text(orderData['custom'][index], style: GoogleFonts.getFont("Oswald", fontSize: 20),),
                        customList.length > 0 && customList.contains(orderData['custom'][index])==true
                            ?  Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.check_circle,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        )
                            : Container(),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      ),
    );
  }


}
