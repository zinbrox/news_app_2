import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/loginPage.dart';

class Splash extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.waiting) {
          return returnScaffold();
        }
        else {
          return LoginPage();
        }

        });
  }

  Widget returnScaffold(){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Posit \nNews.", style: GoogleFonts.getFont("Oswald", fontSize: 100.0), textAlign: TextAlign.left,),
        ],
      )

    );
  }
}