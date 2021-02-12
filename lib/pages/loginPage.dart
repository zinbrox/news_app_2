import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/blocs/color_styles.dart';
import 'package:news_app_2/pages/sign_in.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:delayed_display/delayed_display.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

void initState() {}

class _LoginPageState extends State<LoginPage> {

  /*
  void initState(){
    signInWithGoogle().then((result) {
      if (result != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Home();
            },
          ),
        );
      }
    });
  }

   */
  @override
  Widget build(BuildContext context) {
    DarkThemeProvider _themeChanger = Provider.of<DarkThemeProvider>(context);
    bool isDark = _themeChanger.darkTheme;

    return Scaffold(
      body: Container(
        child: Center(
          child: DelayedDisplay(
            delay: Duration(seconds: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Align(alignment: Alignment.centerLeft,child: Text("Log In\nTo\nContinue.", style: GoogleFonts.getFont("Oswald", fontSize: 80,),)),
                SizedBox(height: 50.0),
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/Google_Logo.png", height: 40.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Sign In With Google",
                          style: GoogleFonts.getFont("Open Sans",
                              color: Colors.black,
                            fontSize: 20.0
                          ),
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    print("Pressed Login");
                    signInWithGoogle().then((result) {
                      if (result != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
