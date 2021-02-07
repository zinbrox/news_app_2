import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/home_news.dart';

class Category_Selection extends StatefulWidget {
  @override
  _Category_SelectionState createState() => _Category_SelectionState();
}

class _Category_SelectionState extends State<Category_Selection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
          primary: false,
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          crossAxisSpacing: 10,
          mainAxisSpacing: 1,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                category="Business";
                Navigator.pushNamed(context, '/home_news');
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Business1.jpeg'),)),
                  Text("Business", style: GoogleFonts.getFont("Oswald", fontSize: 30.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Entertainment";
                Navigator.pushNamed(context, '/home_news');
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Entertainment.jpg'),)),
                  Text("Entertainment", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                category="General";
                Navigator.pushNamed(context, '/home_news');
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(borderRadius: BorderRadius.circular(10.0), child: Image(image: AssetImage('assets/General.jpg'),),),
                  Text("General", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Health";
                Navigator.pushNamed(context, '/home_news');
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Health1.jpg'),),),
                  Text("Health", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Science";
                Navigator.pushNamed(context, '/home_news');
              },
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Science.jpg'),),),
                    Text("Science", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Sports";
                Navigator.pushNamed(context, '/home_news');
              },
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Sports.jpg'),),),
                    Text("Sports", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Technology";
                Navigator.pushNamed(context, '/home_news');
              },
              child: Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Technology.jpg'),),),
                    Text("Technology", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}
