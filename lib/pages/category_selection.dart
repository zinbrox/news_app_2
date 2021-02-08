import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_2/pages/home.dart';
import 'package:news_app_2/pages/home_news.dart';

List<String> AssetImages = [
  "assets/Business1.jpeg",
  "assets/Entertainment.jpg",
  "assets/General.jpg",
  "assets/Health1.jpg",
  "assets/Science.jpg",
  "assets/Sports.jpg",
  "assets/Technology.jpg"
];
List<String> ImageNames = [
  "Business",
  "Entertainment",
  "General",
  "Health",
  "Science",
  "Sports",
  "Technology"
];

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
  Widget build(BuildContext context) {
    return Column(
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
                        type="Search";
                        Navigator.pushNamed(context, '/home_news');
                      },
                    ),
                    hintText: "Search"),
              ),
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: false,
            itemCount: AssetImages.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    category=ImageNames[index];
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
    );
    /*Container(
          child: GridView.count(
              primary: false,
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 1,
              crossAxisCount: 2,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    category="Business";
                    Navigator.pushNamed(context, '/home_news');
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Business1.jpeg'),)),
                      Text("Business", style: GoogleFonts.getFont("Oswald", fontSize: 30.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    category="Entertainment";
                    Navigator.pushNamed(context, '/home_news');
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Entertainment.jpg'),)),
                      Text("Entertainment", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    category="General";
                    Navigator.pushNamed(context, '/home_news');
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(borderRadius: BorderRadius.circular(10.0), child: Image(image: AssetImage('assets/General.jpg'),),),
                      Text("General", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    category="Health";
                    Navigator.pushNamed(context, '/home_news');
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Health1.jpg'),),),
                      Text("Health", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    category="Science";
                    Navigator.pushNamed(context, '/home_news');
                  },
                  child: Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Science.jpg'),),),
                        Text("Science", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    category="Sports";
                    Navigator.pushNamed(context, '/home_news');
                  },
                  child: Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Sports.jpg'),),),
                        Text("Sports", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    category="Technology";
                    Navigator.pushNamed(context, '/home_news');
                  },
                  child: Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image(image: AssetImage('assets/Technology.jpg'),),),
                        Text("Technology", style: GoogleFonts.getFont("Oswald",fontSize: 30.0, color: Colors.white),),
                      ],
                    ),
                  ),
                ),
              ],
          ),
        ); */
  }
}
