import 'package:flutter/material.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/home_news.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/pages/category_selection.dart';
import 'package:news_app_2/pages/category_news.dart';

void main() {
  runApp(MaterialApp(
  initialRoute: '/home',
    routes: {
      '/home':(context) => Home(),
      '/home_news':(context) => Home_News(),
      '/article_view':(context) => Article_View(),
      '/category_selection':(context) => Category_Selection(),
      '/category_news':(context) => Category_News(),
    },
  ));
}

