import 'package:flutter/material.dart';
import 'package:news_app_2/pages/category_news.dart';

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
          padding: const EdgeInsets.all(15),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                category="Business";
                Navigator.pushNamed(context, '/category_news');
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Text("Business"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Entertainment";
                Navigator.pushNamed(context, '/category_news');
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Text("Entertainment"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                category="General";
                Navigator.pushNamed(context, '/category_news');
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Text("General"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Health";
                Navigator.pushNamed(context, '/category_news');
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Text("Health"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Science";
                Navigator.pushNamed(context, '/category_news');
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Text("Science"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Sports";
                Navigator.pushNamed(context, '/category_news');
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Text("Sports"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                category="Technology";
                Navigator.pushNamed(context, '/category_news');
              },
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Text("Technology"),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}
