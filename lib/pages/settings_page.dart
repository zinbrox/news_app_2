import 'package:flutter/material.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:news_app_2/blocs/theme.dart';
import 'package:provider/provider.dart';
import 'package:news_app_2/blocs/color_styles.dart';

class Settings_Page extends StatefulWidget {
  @override
  _Settings_PageState createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider _themeChanger = Provider.of<DarkThemeProvider>(context);
    return Container(
      child: Column(
        children: <Widget>[
          FlatButton(
            child: Text("Light Theme"),
            onPressed: () => _themeChanger.darkTheme=false,),
          FlatButton(
              child: Text("Dark Theme"),
              onPressed: () => _themeChanger.darkTheme=true),

        ],
      ),
    );
  }
}
