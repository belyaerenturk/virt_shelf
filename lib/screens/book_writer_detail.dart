import 'package:flutter/material.dart';
import 'package:virt_shelf/database/db_books.dart';

class BookWriterDetail extends StatefulWidget {
  DbBooks books;

  BookWriterDetail({this.books});

  @override
  _BookWriterDetailState createState() => _BookWriterDetailState();
}

class _BookWriterDetailState extends State<BookWriterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay Sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              widget.books.isim,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.pink),
            ),
            Text(
              widget.books.yazar,
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
