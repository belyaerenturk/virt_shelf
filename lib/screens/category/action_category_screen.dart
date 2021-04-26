import 'package:flutter/material.dart';

import '../../item_card.dart';
import '../reading_page.dart';

class ActionCategory extends StatefulWidget {
  @override
  _ActionCategoryState createState() => _ActionCategoryState();
}

class _ActionCategoryState extends State<ActionCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ItemCard(
                    title: "Solo Leveling",
                    auth: "Chu-Gong",
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ItemCard(
                    title: "Olasılıksız",
                    auth: "Adam Fawer",
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ItemCard(
                    title: "The Witcher",
                    auth: "Andrzej Sapkowski",
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
      ),
    );
  }
}

