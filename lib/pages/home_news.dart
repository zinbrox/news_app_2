import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app_2/pages/article.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/news.dart';
import 'package:news_app_2/pages/article_view.dart';
import 'package:google_fonts/google_fonts.dart';


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
    setState(() {

    });
  }


  @override
  void initState(){
    print("In initState()");
    super.initState();
    getNews();
    country = "";
    setState(() {
      _loading=false;
    });
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: appBarReturn(),
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
                          style: GoogleFonts.getFont('Oswald',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500, ),

                        ),
                        Text(
                          newslist[index].description,
                          style: GoogleFonts.getFont('Roboto',
                          fontSize: 15.0,),
                        ),
                        Text(
                            DateFormat('kk:mm dd-MM-yyyy').format(newslist[index].publishedDate),
                          style: GoogleFonts.getFont('Roboto'),
                        ),
                        const Divider(
                          color: Colors.white,
                          height: 20,
                          thickness: 3,
                          indent: 00,
                          endIndent: 0,
                        ),
                      ],

                    ),
                  ),
                );
              }
              ),
        ),
      );
    }

    Widget appBarTitleReturn(){
      if(type=="Categories")
        return Text(
            category.toString(),
          style: GoogleFonts.getFont('Oswald',
          fontSize: 25.0,),
        );
    }
    Widget appBarReturn(){
    if(type=="Categories")
      return AppBar(
        title: appBarTitleReturn(),
        centerTitle: true,
      );
    }
  }

