import 'package:flutter/material.dart';
import 'product_grid_tile.dart';
import 'product_manager.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorites;

  const ProductGrid(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    final productManager = ProductManager();
    final products =
        showFavorites ? productManager.favoriteItems : productManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, i) => ProductGridTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
