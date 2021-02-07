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
  final tabNames = ["Headlines", "Categories", "Settings"];
  final tabs = [
    Home_News(),
    Category_Selection(),
    Settings_Page(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(tabNames[_currentIndex].toString()),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: tabBarReturn(),
        ),
        bottomNavigationBar: bottomNavigationBarFunction(),
        body: _currentIndex==0 ?
        TabBarView(
          children: [
            Home_News(),
            Home_News(),
          ],
        ) : tabs[_currentIndex],

      ),
    );
  }
  Widget bottomNavigationBarFunction()
  {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
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

  Widget tabBarReturn() {
    if(_currentIndex==0)
    return TabBar(
  tabs: [
  Text("Worldwide"),
  Text("India"),
  ],
  );
}

}


