import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:news_app_2/pages/article.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:news_app_2/pages/home.dart'; //For bottomNavigationBarFunction()
import 'package:http/http.dart' as http;

String category;
class CategoryNews{
  List<Article> news_articles = [];
  Future<void> getCategoryNews(String category) async{
    print("In getCategoryNews() of class CategoryNews");
    String url = "http://newsapi.org/v2/top-headlines?sortBy=popularity&language=en&category=$category&apiKey=fb746a4bae534ed2a5be2393127e2ed8";
    var response = await http.get(url);
    print("Got data");

    var jsonData = jsonDecode(response.body);
    Article article;
    if( jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null) {
          print(element['title'].toString());
          print("Huh");
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
  }
}