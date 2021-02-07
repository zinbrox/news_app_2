import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:provider/provider.dart';

class Settings_Page extends StatefulWidget {
  @override
  _Settings_PageState createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {
  @override
  Widget build(BuildContext context) {
    DarkThemeProvider _themeChanger = Provider.of<DarkThemeProvider>(context);
    bool isSwitched = _themeChanger.darkTheme;
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Light Theme", style: GoogleFonts.getFont("Oswald", fontSize: 25.0),),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    value == false
                        ? _themeChanger.darkTheme = false
                        : _themeChanger.darkTheme = true;
                  });
                },
                activeColor: Colors.deepPurple,
                activeTrackColor: Colors.purpleAccent[400],
              ),
              Text("Dark Theme", style: GoogleFonts.getFont("Oswald", fontSize: 25.0,),),
            ],
          ),
          /*
          FlatButton(
            child: Text("Light Theme"),
            onPressed: () => _themeChanger.darkTheme = false,
          ),
          FlatButton(
              child: Text("Dark Theme"),
              onPressed: () => _themeChanger.darkTheme = true),
          */
        ],
      ),
    );
  }
}
