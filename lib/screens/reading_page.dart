import 'package:flutter/material.dart';

class ReadingPage extends StatefulWidget {
  @override
  _ReadingPageState createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AlertDialog(
        title: Text("UYARI"),
        content: Column(
          children: [
            Text(
              "İçeriğe şu anda ulaşılamıyor, lütfen daha sonra tekrar deneyiniz.",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
