import 'package:ct484_project/ui/products/product_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../cart/cart_manager.dart';
import 'product_detail_screen.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product),
              ),
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: ValueListenableBuilder<bool>(
        valueListenable: product.isFavoriteListenable,
        builder: (context, isFavorite, child) {
          return IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              product.isFavorite = !isFavorite;
            },
          );
        },
      ),
      title: Text(
        product.name,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        onPressed: () {
          final cart = context.read<CartManager>();
          cart.addItem(product);
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: const Text(
              'Item added to cart',
              ),
              duration: const Duration(seconds: 2),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  cart.removeItem(product.id!);
                },
              ),
            ),
          );
          },
          color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
        onPressed: () {
          context.read<ProductManager>().deleteProduct(product.id!);
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'Product deleted',
                textAlign: TextAlign.center,
                ),
            ),
          );
        },
        color: Theme.of(context).colorScheme.error,
    );
  }

}
