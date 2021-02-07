import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenArguments {
  final String articleURL;

  ScreenArguments(this.articleURL);
}

class Article_View extends StatefulWidget {
  @override
  _Article_ViewState createState() => _Article_ViewState();
}

class _Article_ViewState extends State<Article_View> {

  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Article View",
        style: GoogleFonts.getFont("Oswald",fontSize: 25.0),),
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: args.articleURL,
          onWebViewCreated: (WebViewController c){
            _controller.complete(c);
          },
        ),

      ),
    );
  }
}
