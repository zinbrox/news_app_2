import 'package:flutter/material.dart';

class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  final TextEditingController _text = new TextEditingController();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);

  _Search_PageState() {
    _text.addListener(() {
      if(_text.text.isEmpty) {
        _searchText = "";
      }
      else {
        _searchText = _text.text;
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
                  child: TextFormField(
                    controller: _text,
                    decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Search"),
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
