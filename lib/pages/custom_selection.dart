import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/pages/home_news.dart';

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

  @override
  void initState() {
    print("In initState() of Custom_Selection");
    loadlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferences"),
        centerTitle: true,
      ),
      body: Container(
        child: customReturn(),
      ),
      /*Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
                itemCount: itemList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GridItem(
                    item: itemList[index],
                    isSelected: (bool value) {
                      setState(() {
                        if (value) {
                          selectedTerms.add(itemList[index]);
                          customTerms.add(itemList[index].term);
                        }
                        else {
                          selectedTerms.remove(itemList[index]);
                          customTerms.remove(itemList[index].term);
                        }
                      });
                    },
                    key: Key(itemList[index].rank.toString()),

                  );
                }),
          ),
        ],
      ),
      */
    );
  }

  Widget customReturn() {
    return StreamBuilder(
      stream: firestoreInstance.collection("preferences").doc("keywords").snapshots(),
      builder: (context, snapshot) {
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 4.0, crossAxisSpacing: 4.0),
            itemCount: snapshot.data['custom'].length,
            itemBuilder: (BuildContext context, int index) {
              var orderData = snapshot.data;
              return GestureDetector(
                onTap: () {
                  firestoreInstance.collection("userPreferences").doc(firebaseUser.uid).get().then((result)
                  {
                      if(result.data()['custom'].contains(orderData['custom'][index])) {
                        firestoreInstance
                            .collection("userPreferences")
                            .doc(firebaseUser.uid)
                            .update({
                          'array': FieldValue.arrayRemove(
                              [orderData['custom'][index]])
                        });
                        //customTerms.remove(orderData['custom'][index]);
                      }
                      else {
                        firestoreInstance
                            .collection("userPreferences")
                            .doc(firebaseUser.uid)
                            .update({
                          'array': FieldValue.arrayUnion(
                              [orderData['custom'][index]])
                        });
                        //customTerms.add(orderData['custom'][index]);
                      }
                  });
                  /*
                  if (customTerms.contains(orderData.data()['custom']))
                    customTerms.remove(orderData.data()['custom']);
                  else if (!customTerms.contains(orderData.data()['custom']))
                    customTerms.add(orderData.data()['custom']);
                  print(customTerms);

                   */
                  print(orderData['custom']);
                  setState(() {

                  });
                },
                child: Stack(
                  children: <Widget>[
                    Text(orderData['custom'][index]),
                    customTerms.contains(orderData.data()['custom'])
                        ? Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check_circle,
                        ),
                      ),
                    )
                        : Container(),
                  ],
                ),
              );
            });
      },
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
