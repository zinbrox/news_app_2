import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/home.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _text = new TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser =  FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback", style: GoogleFonts.getFont("Oswald"),),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Column(
          children: <Widget>[
            SizedBox(height: 30,),
            TextFormField(
              controller: _text,
              maxLines: 12,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                //border: OutlineInputBorder(borderSide: new BorderSide(color: Colors.white, width: 20.0)),
                hintText: "Enter Feedback",
              ),

            ),
            SizedBox(height: 20,),
            RaisedButton(
                onPressed: (){
                  final snackBar = SnackBar(content: Text('Thank you for your Feedback!'));
                  Scaffold.of(context).showSnackBar(snackBar);
                  FocusScope.of(context).unfocus();
                  firestoreInstance
                      .collection("feedbackCollection")
                      .doc('feedback')
                      .update({
                    'feedbackArray': FieldValue.arrayUnion([firebaseUser.displayName + " : " + _text.text])
                  });
                  print("Feedback Sent");
                },
              padding: const EdgeInsets.all(15.0),
              child: Text("Submit Feedback", style: GoogleFonts.getFont ("Oswald", color: Colors.black, fontSize: 25),),
                color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                ),
          ],
        ),
      ),
    );
  }
}
