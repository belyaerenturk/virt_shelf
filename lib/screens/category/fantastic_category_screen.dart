import 'package:flutter/material.dart';
import 'package:virt_shelf/screens/reading_page.dart';

import '../../item_card.dart';

class FantasticCategory extends StatefulWidget {
  @override
  _FantasticCategoryState createState() => _FantasticCategoryState();
}

class _FantasticCategoryState extends State<FantasticCategory> {
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ItemCard(
                    title: "Yüzüklerin Efendisi",
                    auth: "J. R. R. Tolkien",
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
