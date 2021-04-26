import 'package:flutter/material.dart';
import 'package:virt_shelf/screens/category/category_page.dart';
import 'package:virt_shelf/screens/opening_screen.dart';
import 'package:virt_shelf/screens/reading_page.dart';

import '../item_card.dart';

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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.display1,
                      children: [
                        TextSpan(text: "\n"),
                        TextSpan(
                            text: "Okumaya ",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        //TextSpan(text: "Continue "),
                        TextSpan(
                          text: "devam et...",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(38.5),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Color(0xFFD3D3D3).withOpacity(.84),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(38.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlatButton(
                      height: 73,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ReadingPage();
                            },
                          ),
                        );
                      },
                      child: Expanded(
                        child: Padding(
                          padding:
                          EdgeInsets.only(left: 30, right: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Harry Potter",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "J. K. Rowling",
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                      Alignment.bottomRight,
                                      child: Text(
                                        "Bölüm 1 / 5\t",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 7,
                      width: size.width * .1,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        //kProgressIndicator,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
