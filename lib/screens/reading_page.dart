import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:virt_shelf/items/books.dart';

class ReadingPage extends StatefulWidget {
  String asset = "";
  String title;


  ReadingPage({this.asset, this.title});

  @override
  _ReadingPageState createState() => _ReadingPageState(asset, title);
}

class _ReadingPageState extends State<ReadingPage> {
  String pdfasset = "";
  String pdfTitle = "";
  PDFDocument _doc;
  bool _loading;
  Book book;


  _ReadingPageState(this.pdfasset, this.pdfTitle);

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdfasset);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pdfTitle),),
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc,
        indicatorBackground: Colors.red,
        //showIndicator: false,
        showPicker: false,
      ),
    );
  }
}
