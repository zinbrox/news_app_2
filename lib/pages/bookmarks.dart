import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app_2/pages/article.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/article_view.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  List<Article> newslist = new List<Article>();
  Article article;
  bool _loading=true;


  @override
  void initState(){
    print("In Bookmarks initState()");
    super.initState();
    setState(() {});
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks"),
        centerTitle: true,
      ),
      body:  Container(
        child: bookmarkCardReturn(),

      ),
    );
    }
  Widget bookmarkCardReturn() {
    print("In bookmarkCardReturn");

    return StreamBuilder(
      stream: firestoreInstance.collection("users").doc(firebaseUser.uid).collection("bookmarks").snapshots(),
      builder: (context, snapshot){
              return snapshot.hasData ?
              ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index){
                    DocumentSnapshot orderData = snapshot.data.docs[index];
                    return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/article_view',
                      arguments:
                      ScreenArguments(orderData.data()['articleURL']));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: FadeInImage.assetNetwork(
                            placeholder: 'assets/LoadingGif.gif',
                            image: orderData.data()['imageURL']),
                      ),
                      Text(
                        orderData.data()['pageTitle'],
                        style: GoogleFonts.getFont(
                          'Oswald',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        orderData.data()['description'],
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontSize: 15.0,

                        ),
                      ),
                      Text(
                        DateFormat('kk:mm dd-MM-yyyy').format(orderData.data()['date'].toDate()),
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 20,
                        thickness: 3,
                        indent: 00,
                        endIndent: 0,
                      ),
                    ],
                  ),
                ),
              );

            }) : Center(child: CircularProgressIndicator());
      },
    );
  }
}
