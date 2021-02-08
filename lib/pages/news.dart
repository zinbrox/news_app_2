import 'package:http/http.dart' as http;
import 'package:news_app_2/pages/article.dart';
import 'package:news_app_2/pages/home.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app_2/pages/home_news.dart';

class News {
  // ignore: non_constant_identifier_names
  List<Article> news_articles = [];
  Future<void> getNews() async{
    print("In getNews() of class News");
    String url;
    if(country == "in")
    url = "http://newsapi.org/v2/top-headlines?sortBy=popularity&language=en&country=$country&apiKey=fb746a4bae534ed2a5be2393127e2ed8";
    else if(type == "Headlines")
      url = "http://newsapi.org/v2/top-headlines?sortBy=popularity&language=en&apiKey=fb746a4bae534ed2a5be2393127e2ed8";
    else if(type == "Search")
      url = "http://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&language=en&apiKey=fb746a4bae534ed2a5be2393127e2ed8";
    else if(type == "Categories")
      url = "http://newsapi.org/v2/top-headlines?sortBy=popularity&language=en&category=$category&apiKey=fb746a4bae534ed2a5be2393127e2ed8";
    else
      return null;
    var response = await http.get(url);
    print("Got data");

  var jsonData = jsonDecode(response.body);
  Article article;
  if( jsonData['status'] == 'ok'){
    jsonData["articles"].forEach((element){
     if(element['urlToImage'] != null && element['description'] != null) {
      article = Article(
          title: element['title'],
          description: element['description'],
          author: element['author'],
          imageURL: element['urlToImage'],
          publishedDate: DateTime.parse(element['publishedAt']),
          content: element["content"],
          articleURL: element["url"],
      );
  news_articles.add(article);
  }
  });
  }
  else
    print("Not ok");
  //return _NewsTileState(article.title, article.description, article.imageURL, article.content, article.articleURL);

}

}

class Country_News extends StatefulWidget {
  @override
  _Country_NewsState createState() => _Country_NewsState();
}

class _Country_NewsState extends State<Country_News> {

  @override
  void initState() {
    print("In initState of Country_News");
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }

  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Home_News();
  }
}

