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
                    Image(image: AssetImage('assets/Business.jpg'),),
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
                    Image(image: AssetImage('assets/Entertainment.jpg'),),
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
                    Image(image: AssetImage('assets/General.jpg'),),
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
                    Image(image: AssetImage('assets/Health.jpg'),),
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
                    Image(image: AssetImage('assets/Science.jpg'),),
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
                    Image(image: AssetImage('assets/Sports.jpg'),),
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
                    Image(image: AssetImage('assets/Technology.jpg'),),
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
