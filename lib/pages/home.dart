import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/pages/news.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/pages/category_selection.dart';
import 'package:news_app_2/pages/home_news.dart';
import 'package:news_app_2/pages/settings_page.dart';


String type = "Headlines"; //For later combining into single function ** NOT DONE YET **

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final tabNames = ["Headlines", "Category", "Settings"];
  final tabs = [
    Home_News(),
    Category_Selection(),
    Settings_Page(),

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(tabNames[_currentIndex].toString()),
          centerTitle: true,
        ),
        bottomNavigationBar: bottomNavigationBarFunction(),
        body: tabs[_currentIndex],

      ),
    );
  }
  Widget bottomNavigationBarFunction()
  {
    return BottomNavigationBar(
      selectedItemColor: Colors.deepPurple,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Top Headlines'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text("Category"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"),
        ),
      ],
      onTap: (index){
        setState(() {
          if(index==0)
            type="Headlines";
          else if(index==1)
            type="Categories";
          _currentIndex=index;
        });
      },
    );
  }

}


