import 'package:flutter/material.dart';
import 'package:news_app_2/blocs/theme.dart';
import 'package:provider/provider.dart';

class Settings_Page extends StatefulWidget {
  @override
  _Settings_PageState createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Container(
      child: Column(
        children: <Widget>[
          FlatButton(
            child: Text("Light Theme"),
            onPressed: () => _themeChanger.setTheme(ThemeData.light())),
          FlatButton(
              child: Text("Dark Theme"),
              onPressed: () => _themeChanger.setTheme(ThemeData.dark())),

        ],
      ),
    );
  }
}
