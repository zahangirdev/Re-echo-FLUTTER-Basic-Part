import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final Box favBox = Hive.box('favorites');

  // Example items for kids
  final List<String> items = [
    " Apple",
    "Banana",
    "Strawberry",
    "Teddy Bear",
    "Toy Car",
    "Colors",
    "Story Book",
  ];

  // Add or remove favorite
  void toggleFavorite(String item) {
    if (favBox.containsKey(item)) {
      favBox.delete(item); // ❌ Delete (Remove favorite)
    } else {
      favBox.put(item, true); // ✅ Create (Mark as favorite)
    }
    setState(() {}); // Update UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          String item = items[index];
          bool isFavorite = favBox.containsKey(item);

          return Card(
            color: Colors.red,
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                item,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.white : Colors.yellow,
                  size: 30,
                ),
                onPressed: () => toggleFavorite(item),
              ),
            ),
          );
        },
      ),
    );
  }
}
