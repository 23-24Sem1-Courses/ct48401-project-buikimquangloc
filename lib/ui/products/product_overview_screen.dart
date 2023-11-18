import 'package:flutter/material.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // ignore: unused_field
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VFood'),
        actions: <Widget>[
          buildMenu(),
          buildCartIcon(),
        ],
      ),
    );
  }

  Widget buildMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites = true;
          } else {
            _showOnlyFavorites = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text("Only Favorites"),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('show only all'),
        ),
      ],
    );
  }

  Widget buildCartIcon() {
    return IconButton(
      icon: const Icon(
        Icons.shopping_cart,
      ),
      onPressed: () {
        print("Cart Screen");
      },
    );
  }
}
