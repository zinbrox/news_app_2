import 'package:flutter/material.dart';

class EasterEgg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(":)"),
        centerTitle: true,
      ),
      body: Center(
        child: Image(
          image: AssetImage("assets/RickRoll.gif"),
        ),
      ),
    );
  }
}
