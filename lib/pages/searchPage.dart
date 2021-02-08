import 'package:flutter/material.dart';
import 'package:news_app_2/pages/home.dart';

class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  final TextEditingController _text = new TextEditingController();
  Icon _searchIcon = new Icon(Icons.search);

  _Search_PageState() {
    _text.addListener(() {
      if (_text.text.isEmpty) {
        searchText = "";
      } else {
        searchText = _text.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _searchIcon,
                Container(
                  width: 325.0,
                  child: TextField(
                    controller: _text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            searchText = _text.text;
                            Navigator.pushNamed(context, '/home_news');
                          },
                        ),
                        hintText: "Search"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
