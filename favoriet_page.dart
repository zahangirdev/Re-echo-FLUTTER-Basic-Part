import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<String> items = [
    "A",
    "B",
    "C",
    "D",
    "E",
  ];
  Box<String> get favoriteBox => Hive.box<String>("fav");
  bool isfav(String id) {
    return favoriteBox.containsKey(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Items List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index]),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            ),
          );
        },
      ),
    );
  }
}
