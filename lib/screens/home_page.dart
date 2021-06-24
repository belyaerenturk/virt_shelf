import 'package:flutter/material.dart';
import 'package:virt_shelf/items/books.dart';
import 'package:virt_shelf/items/constants.dart';
import 'package:virt_shelf/items/side_menu.dart';
import 'package:virt_shelf/screens/detail_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // appBar
    final appbar = AppBar(
      backgroundColor: vDarkViolet,
      elevation: .5,
      title: Text("Kitaplar"),
    );

    // create book title hero
    createTile(Book book) => Hero(
          tag: book.title,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.yellow.shade900,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(book)));
              },
              child: Image(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

    // create book grid tiles
    final grid = CustomScrollView(
      primary: false,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: books.map((book) => createTile(book)).toList(),
          ),
        ),
      ],
    );
    return Scaffold(
      drawer: SideMenu(),
      backgroundColor: vDarkViolet,
      appBar: appbar,
      body: grid,
    );
  }
}
