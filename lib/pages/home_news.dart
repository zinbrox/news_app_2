import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/pages/article.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/news.dart';
import 'package:news_app_2/pages/article.dart';
import 'dart:async';

import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/pages/category_news.dart';


// ignore: camel_case_types
class Home_News extends StatefulWidget {
  @override
  _Home_NewsState createState() => _Home_NewsState();
}

// ignore: camel_case_types
class _Home_NewsState extends State<Home_News> {

  List<Article> newslist = new List<Article>();
  bool _loading;

  getNews() async {
    print("In Function getNews()");
    News news = News();
    await news.getNews();
    newslist = news.news_articles;
    print("Back in original getNews()");
    print(newslist[0].articleURL);
    setState(() {

    });
  }
  CategoryGetNews() async {
    print("In Function getNews()");
    CategoryNews news = CategoryNews();
    await news.getCategoryNews(category);
    newslist = news.news_articles;
    print("Back in original getNews()");
    print(newslist[0].articleURL);
    setState(() {

    });
  }

  @override
  void initState(){
    print("In initState()");
    super.initState();
    if(type=="Headlines")
      getNews();
    else if(type=="Categories")
      CategoryGetNews();
    setState(() {
      _loading=false;
    });
  }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Scaffold(

          body: _loading? Center(
            child: CircularProgressIndicator(),
          ) : Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ListView.builder(
                itemCount: newslist.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/article_view', arguments: ScreenArguments(newslist[index].articleURL));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/loader.gif',
                                  image: newslist[index].imageURL
                              ),
                          ),
                          Text(
                              newslist[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: "Helvetica"),

                          ),
                          Text(newslist[index].description),
                        ],

                      ),
                    ),
                  );
                }
                ),
          ),
        ),
      );
    }
  }

