import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/bookmarks.dart';
import 'package:news_app_2/pages/category_selection.dart';
import 'package:news_app_2/pages/home_news.dart';
import 'package:news_app_2/pages/news.dart';
import 'package:news_app_2/pages/side_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

String type = "Headlines"; //For combining into single function
String country = "";
String category;
String searchText = "";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  int _toptabIndex = 0;
  final tabNames = ["Headlines", "My News", "Explore", "Bookmarks"];
  final tabs = [
    Home_News(),
    Custom_Search(),
    Category_Selection(),
    Bookmark(),
  ];
  final toptabs = [
    Home_News(),
    Country_News(),
  ];

  void saveIndex() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('topTabIndex', 0);
  }
  @override
  void initState() {
    super.initState();
    saveIndex();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: SideDrawer(),
          appBar: AppBar(
            title: Text(
              tabNames[_currentIndex].toString(),
              style: GoogleFonts.getFont(
                'Oswald',
                fontSize: 25.0,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: true,
            bottom: tabBarReturn(),
          ),
          bottomNavigationBar: bottomNavigationBarFunction(),
          body: _currentIndex == 0 ? toptabs[_toptabIndex] : tabs[_currentIndex],
        ),
      ),
    );
  }
  void getPageIndex() async {
    final prefs = await SharedPreferences.getInstance();
    final topIndex = prefs.getInt('topTabIndex');
  }

  Widget bottomNavigationBarFunction() {
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
          icon: Icon(Icons.article),
          title: Text('My News'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text("Category"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          title: Text("Bookmarks"),
        ),
      ],
      onTap: (index) {
        //getCountry();
        print("_toptabIndex = $_toptabIndex");
        setState(() {

          if (index == 0 && _toptabIndex==0)
            type = "Headlines";
          else if (index == 0 && _toptabIndex==1)
            type = "Country";
          else if (index == 1)
            type = "Custom";
          else if (index == 2)
            type = "Categories";
          else if (index == 3)
            type = "Bookmarks";
          _currentIndex = index;
        });
      },
    );
  }

  Widget tabBarReturn() {
    if (_currentIndex == 0)
      return PreferredSize(
        preferredSize: Size(30.0, 30.0),
        child: TabBar(
          physics: AlwaysScrollableScrollPhysics(),
          tabs: [
            Text(
              "Worldwide",
              style: GoogleFonts.getFont(
                "Oswald",
                fontSize: 20.0,
              ),
            ),
            Text(
              //countryName.toString(),
              "India",
              style: GoogleFonts.getFont(
                "Oswald",
                fontSize: 20.0,
              ),
            ),
          ],
          onTap: (index) {
            print("TopTab pressed");
            setState(() {

            });
            //getCountry();
            setState(() {
              print(index);
              if(index==0) {
                type="Headlines";
              }
              if (index == 1) {
                country = "in";
                type = "Country";
              }
              _toptabIndex = index;
            });
            print(country);
          },
        ),
      );

  }
}
