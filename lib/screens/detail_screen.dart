import 'dart:io';

import 'package:virt_shelf/items/books.dart';
import 'package:virt_shelf/items/constants.dart';
import 'package:virt_shelf/items/pdf_api.dart';
import 'package:virt_shelf/items/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:virt_shelf/screens/pdf_viewer_page.dart';

/*class DetailScreen extends StatelessWidget {

}*/

class DetailScreen extends StatefulWidget {
  final Book book;
  DetailScreen(this.book);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: mdDarkPink,
      elevation: .5,
      title: Text("Kitap Detayı"),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );

    // detail of book image and it's a pages
    final topLeft = Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: widget.book.title,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.yellow.shade900,
              child: Image(
                image: AssetImage(widget.book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text('${widget.book.pages} sayfa', color: Colors.black38, size: 12)
      ],
    );

    // detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(widget.book.title,
            size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
        text(
          "${widget.book.writer} tarafından",
          color: Colors.black54,
          size: 12,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        RatingBar(
          rating: widget.book.rating,
        ),
        SizedBox(
          height: 32,
        ),
        MaterialButton(
          onPressed: () async {
            final path = 'assets/books/${widget.book.url}';
            final file = await PDFApi.loadAsset(path);
            openPDF(context, file);
          },
          minWidth: 160.0,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: text("Oku", color: Colors.white, size: 13),
          ),
        ),
      ],
    );

    final topContent = Container(
      color: mdDarkPink,
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    // scrolling text description
    final bottomContent = Container(
      height: 300.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          widget.book.description,
          style: TextStyle(fontSize: 18.0, height: 1.2),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [topContent, bottomContent],
      ),
    );

  }

  // create text widget
  text(
    String data, {
    Color color = Colors.black87,
    num size = 14,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    bool isBold = false,
  }) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );
}
