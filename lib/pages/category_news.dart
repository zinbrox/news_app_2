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
    //return _NewsTileState(article.title, article.description, article.imageURL, article.content, article.articleURL);

  }


}

class Category_News extends StatefulWidget {
  @override
  _Category_NewsState createState() => _Category_NewsState();
}

class _Category_NewsState extends State<Category_News> {

  List<Article> newslist = new List<Article>();
  bool _loading;

  getNews() async {
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
    getNews();
    setState(() {
      _loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        /*
        appBar: AppBar(
          title: Text("Home News"),
          centerTitle: true,
        ),

         */

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
                          child: Image(image: NetworkImage(newslist[index].imageURL),),
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
