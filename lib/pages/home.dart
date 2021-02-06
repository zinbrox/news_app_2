import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/pages/news.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/pages/category_selection.dart';
import 'package:news_app_2/pages/home_news.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final tabs = [
    Center(child: Text("Home"),),
    Home_News(),
    Category_Selection(),

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_headline),
              title: Text("View Headline"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Category"),
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
        ),
        body: tabs[_currentIndex],
        /*
        Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Text("Hello"),
              ),
              SizedBox(
                height: 100.0,
              ),
              RaisedButton(
                child: const Text("Start"),
                onPressed: (){
                  Navigator.pushNamed(context, '/home_news');
                },
              ),
            ],
          ),
        ),
        */
      ),
    );
  }
}
