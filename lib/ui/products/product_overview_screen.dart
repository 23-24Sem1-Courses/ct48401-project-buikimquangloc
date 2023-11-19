import 'package:ct484_project/ui/cart/cart_manager.dart';
import 'package:ct484_project/ui/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/app_drawer.dart';
import 'product_grid.dart';
import 'top_right_badge.dart';

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
      drawer: const AppDrawer(),
      body: ProductGrid(_showOnlyFavorites),
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
    return Consumer<CartManager>(
      builder: (ctx, cartManager, child) {
        return TopRightBadge(
          data: cartManager.productCount,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.of(ctx).pushNamed(CartScreen.routeName);
            },
          ),
        );
      },
    );
  }
}
