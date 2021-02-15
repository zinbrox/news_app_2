import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/home_news.dart';
import 'dart:math';

List<String> AssetImages = [
  "assets/Business_Image.jpg",
  "assets/Entertainment_Image.jpg",
  "assets/General_Image.jpg",
  "assets/Health_Image.jpg",
  "assets/Science_Image.jpg",
  "assets/Sports_Image.jpg",
  "assets/Technology_Image.jpg",
  "assets/Random_Image.jpg"
];
List<String> ImageNames = [
  "Business",
  "Entertainment",
  "General",
  "Health",
  "Science",
  "Sports",
  "Technology",
  "Random"
];
Random rnd = new Random();

class Category_Selection extends StatefulWidget {
  @override
  _Category_SelectionState createState() => _Category_SelectionState();
}

class _Category_SelectionState extends State<Category_Selection> {
  final TextEditingController _text = new TextEditingController();
  Icon _searchIcon = new Icon(Icons.search);

  _Category_SelectionState() {
    _text.addListener(() {
      if (_text.text.isEmpty) {
        searchText = "";
      } else {
        searchText = _text.text;
      }
    });
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _searchIcon,
              Container(
                width: 325.0,
                child: TextFormField(
                  controller: _text,
                  maxLines: 1,
                  onChanged: (value){
                    searchText = _text.text;
                  },
                  onFieldSubmitted: (value){
                    FocusScope.of(context).unfocus();
                    searchText = _text.text;
                    type="Search";
                    Navigator.pushNamed(context, '/home_news');
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      //border: OutlineInputBorder(borderSide: new BorderSide(color: Colors.white, width: 20.0)),
                      hintText: "Search",
                      suffixIcon: _text.text.length>0 ? IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          _text.text = "";
                          searchText = _text.text;
                          type="Search";
                        },
                      ) : null,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
                shrinkWrap: false,
                itemCount: AssetImages.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 0.0, childAspectRatio: 1.5),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      int min=0, max=6;
                      int r = min + rnd.nextInt(max - min);
                      if(index==7)
                        category = ImageNames[r];
                      else
                        category=ImageNames[index];
                      type="Categories";
                      Navigator.pushNamed(context, '/home_news');
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              image: AssetImage(AssetImages[index]),
                            )),
                        Text(
                          ImageNames[index],
                          style: GoogleFonts.getFont("Oswald",
                              fontSize: 30.0, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}