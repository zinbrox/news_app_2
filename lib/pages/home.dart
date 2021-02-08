import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/category_selection.dart';
import 'package:news_app_2/pages/home_news.dart';
import 'package:news_app_2/pages/news.dart';
import 'package:news_app_2/pages/searchPage.dart';
import 'package:news_app_2/pages/settings_page.dart';


String type = "Headlines"; //For combining into single function
String country = "";
String category;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  int _toptabIndex=0;
  final tabNames = ["Headlines", "Search", "Categories", "Settings"];
  final tabs = [
    Home_News(),
    Search_Page(),
    Category_Selection(),
    Settings_Page(),
  ];
  final toptabs = [
    Home_News(),
    Country_News(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              tabNames[_currentIndex].toString(),
              style: GoogleFonts.getFont('Oswald',
              fontSize: 25.0,),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: tabBarReturn(),
        ),
        bottomNavigationBar: bottomNavigationBarFunction(),
        body: _currentIndex==0 ? toptabs[_toptabIndex]: tabs[_currentIndex],

      ),
    );
  }
  Widget bottomNavigationBarFunction()
  {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
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
          icon: Icon(Icons.search),
          title: Text('Search'),
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
          else if(index==2)
            type="Categories";
          _currentIndex=index;
        });
      },
    );
  }

  Widget tabBarReturn() {
    if(_currentIndex==0)
    return PreferredSize(
      preferredSize: Size(30.0, 30.0),
      child: TabBar(
  tabs: [
  Text("Worldwide", style: GoogleFonts.getFont("Oswald", fontSize: 20.0,),),
  Text("India", style: GoogleFonts.getFont("Oswald", fontSize: 20.0,),),
  ],
        onTap: (index){
      print("TopTab pressed");
      setState(() {
        print(index);
        if(index == 1)
          country = "in";
        _toptabIndex = index;
      });
      print(country);
        },
  ),
    );
}

}


