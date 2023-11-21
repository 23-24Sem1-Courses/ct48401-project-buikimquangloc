import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'edit_product_screen.dart';
import 'package:logger/logger.dart';

class UserProductListTile extends StatelessWidget {
  final Product product;
  UserProductListTile(
    this.product, {
    super.key,
  });

  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            editButton(context),
            deleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget editButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).pushNamed(
          EditProductScreen.routeName,
          arguments: product.id,
        );
      },
      color: Theme.of(context).primaryColor,
    );
  }

  Widget deleteButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        _logger.d('Delete a product');
      },
      icon: const Icon(Icons.delete),
      color: Theme.of(context).colorScheme.error,
    );
  }
}
