import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/loginPage.dart';
import 'package:news_app_2/pages/home.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return returnScaffold();
          } else {
            return LoginPage();
          }
        });
  }

  Widget returnScaffold() {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Posit \nNews.",
            style: GoogleFonts.getFont("Oswald", fontSize: 100.0),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "A ZB App",
            style: GoogleFonts.getFont("Oswald", fontSize: 25.0),
          ),
        )
      ],
    ));
  }
}
