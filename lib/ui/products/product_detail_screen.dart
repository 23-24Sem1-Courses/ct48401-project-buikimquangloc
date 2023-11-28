import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../cart/cart_manager.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detail';
  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;

  void addToCart(BuildContext context) {
    final cart = context.read<CartManager>();
    cart.addItem(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Sản phẩm đã được thêm vào giỏ hàng'),
        action: SnackBarAction(
          label: 'Hoàn tác',
          onPressed: () {
            cart.removeItem(product.id!);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                color:  Color.fromARGB(255, 102, 95, 230),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addToCart(context); // Gọi hàm để thêm sản phẩm vào giỏ hàng
              },
              child: const Text('Thêm vào giỏ hàng'),
            ),
          ],
        ),
      ),
    );
  }
}
