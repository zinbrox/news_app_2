import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:news_app_2/pages/home_news.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Item {
  String term;
  int rank;

  Item(this.term, this.rank);
}

List<Item> itemList = List();
List<Item> selectedTerms = List();

class Custom_Selection extends StatefulWidget {
  @override
  _Custom_SelectionState createState() => _Custom_SelectionState();
}

class _Custom_SelectionState extends State<Custom_Selection> {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  List<String> customList = new List<String>();
  bool _loading=true;

  loadlist() {
    itemList = List();
    itemList.add(Item("F1", 1));
    itemList.add(Item("F1", 2));
    itemList.add(Item("F1", 3));
    itemList.add(Item("F1", 4));
    itemList.add(Item("Covid-19", 5));
    itemList.add(Item("Apple", 6));
    itemList.add(Item("Google", 7));
    itemList.add(Item("F1", 8));
  }

  Future<bool> checkIfDocExists() async {
    try {
      var collectionRef = firestoreInstance.collection("userPreferences");
      var doc = await collectionRef.doc(firebaseUser.uid).get();
      return doc.exists;
    } catch(e){
      throw e;
    }
  }

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
    //loadlist();
    super.initState();

    getCustomKeywords();
    print(customList);
    //customList = ["Hello","Hi","Test"];
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

                    /*
                  bool docExists = await checkIfDocExists();
                  if(!docExists)
                    {
                      List<String> empty = [];
                      firestoreInstance.collection("userPreferences").doc(firebaseUser.uid).set({'custom':empty});
                    }

                  firestoreInstance.collection("userPreferences").doc(firebaseUser.uid).get().then((result)
                  {

                    if(result.data()['custom'].contains(orderData['custom'][index])) {
                        firestoreInstance
                            .collection("userPreferences")
                            .doc(firebaseUser.uid)
                            .update({
                          'custom': FieldValue.arrayRemove(
                              [orderData['custom'][index]])
                        });
                        //customTerms.remove(orderData['custom'][index]);
                      }
                      else {
                        firestoreInstance
                            .collection("userPreferences")
                            .doc(firebaseUser.uid)
                            .update({
                          'custom': FieldValue.arrayUnion(
                              [orderData['custom'][index]])
                        });
                        //customTerms.add(orderData['custom'][index]);
                      }
                  });

                  if (customTerms.contains(orderData.data()['custom']))
                    customTerms.remove(orderData.data()['custom']);
                  else if (!customTerms.contains(orderData.data()['custom']))
                    customTerms.add(orderData.data()['custom']);
                  print(customTerms);

                   */
                    //print(orderData['custom']);

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

class GridItem extends StatefulWidget {
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  GridItem({this.item, this.isSelected, this.key});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Stack(
        children: <Widget>[
          Text(widget.item.term),
          isSelected
              ? Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.check_circle,
              ),
            ),
          )
              : Container()
        ],
      ),
    );
  }
}
