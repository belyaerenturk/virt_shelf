import 'package:flutter/material.dart';
import 'package:virt_shelf/screens/category/category_page.dart';
import 'package:virt_shelf/screens/edit_profile_page.dart';
import 'package:virt_shelf/screens/opening_screen.dart';
import 'package:virt_shelf/screens/reading_page.dart';
import '../items/item_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black,),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OpeningScreen()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.category, color: Colors.black,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen()));
            },
          ),
          SizedBox(width: size.width * .32),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsUI()));
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * .1,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.display1,
                      children: [
                        TextSpan(text: "En son okunan kitap:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ItemCard(
                  title: "Harry Potter",
                  auth: "J. K. Rowling",
                  pressRead: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ReadingPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
