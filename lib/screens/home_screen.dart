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
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
      ],
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

class DataSearch extends SearchDelegate<String> {
  final titles = [
    "Harry Potter ve Felsefe Taşı",
    "Harry Potter ve Sırlar Odası",
    "Harry Potter ve Azkaban Tutsağı",
    "Harry Potter ve Ateş Kadehi",
    "Harry Potter ve Zümrüdüanka Yoldaşlığı",
    "Harry Potter ve Melez Prens",
    "Harry Potter ve Ölüm Yadigarları",
    "Olasılıksız",
    "The Witcher Elflerin Kanı",
  ];

  final recentTitles = [
    "Harry Potter ve Azkaban Tutsağı",
    "Harry Potter ve Ateş Kadehi",
    "Harry Potter ve Zümrüdüanka Yoldaşlığı",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return HomePage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches something
    final suggestionList = query.isEmpty
        ? recentTitles
        : titles.where((e) => e.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.title),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
