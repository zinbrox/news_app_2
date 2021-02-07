import 'package:flutter/material.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:news_app_2/blocs/theme.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/home_news.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/pages/category_selection.dart';
import 'package:provider/provider.dart';
import 'package:news_app_2/blocs/theme.dart';
import 'package:news_app_2/pages/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  DarkThemeProvider themeChangeProvider =  new DarkThemeProvider();

  void initState(){
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeChangeProvider,
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: '/loginPage',
            routes: {
              '/home':(context) => Home(),
              '/home_news':(context) => Home_News(),
              '/article_view':(context) => Article_View(),
              '/category_selection':(context) => Category_Selection(),
              '/loginPage':(context) => LoginPage(),
            },
          );
        },
      ),


    );
  }
}

class MaterialAppWithTheme extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: theme.getTheme(),
      initialRoute: '/loginPage',
      routes: {
        '/home':(context) => Home(),
        '/home_news':(context) => Home_News(),
        '/article_view':(context) => Article_View(),
        '/category_selection':(context) => Category_Selection(),
        '/loginPage':(context) => LoginPage(),
      },
    );
  }
}


