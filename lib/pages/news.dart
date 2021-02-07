import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_2/pages/article.dart';
import 'package:news_app_2/pages/home.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';

class News {
  // ignore: non_constant_identifier_names
  List<Article> news_articles = [];
  Future<void> getNews() async{
    print("In getNews() of class News");
    String url = "http://newsapi.org/v2/top-headlines?sortBy=popularity&language=en&apiKey=fb746a4bae534ed2a5be2393127e2ed8";
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

