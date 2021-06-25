import 'package:flutter/material.dart';
import 'package:virt_shelf/database/db_bookdao.dart';
import 'package:virt_shelf/database/db_books.dart';
import 'package:virt_shelf/screens/book_writer_detail.dart';

class BookWriter extends StatefulWidget {
  @override
  _BookWriterState createState() => _BookWriterState();
}

class _BookWriterState extends State<BookWriter> {
  Future<List<DbBooks>> showAllWriter() async {
    var yazarListesi = await DbBooksdao().showAllBooks();
    return yazarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<DbBooks>>(
        future: showAllWriter(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var yazarListesi = snapshot.data;
            return ListView.builder(
              itemCount: yazarListesi.length,
              itemBuilder: (context, indeks) {
                var yazar = yazarListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookWriterDetail(
                                  books: yazar,
                                )));
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            yazar.isim,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(yazar.yazar),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
