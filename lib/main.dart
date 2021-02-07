import 'package:flutter/material.dart';
import 'package:news_app_2/blocs/theme.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/home_news.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/pages/category_selection.dart';
import 'package:news_app_2/pages/category_news.dart';
import 'package:provider/provider.dart';
import 'package:news_app_2/blocs/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: theme.getTheme(),
      initialRoute: '/home',
      routes: {
        '/home':(context) => Home(),
        '/home_news':(context) => Home_News(),
        '/article_view':(context) => Article_View(),
        '/category_selection':(context) => Category_Selection(),
        '/category_news':(context) => Category_News(),
      },
    );
  }
}


