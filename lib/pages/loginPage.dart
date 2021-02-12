import 'package:flutter/material.dart';
import 'package:news_app_2/pages/sign_in.dart';
import 'package:news_app_2/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Sign In With Google"),
                onPressed: (){
                  print("Pressed Login");
                  signInWithGoogle().then((result){
                    if(result != null){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
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
    );
  }
}