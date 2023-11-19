import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'edit_product_screen.dart';

class UserProductListTile extends StatelessWidget {
  final Product product;
  const UserProductListTile(
    this.product, {
    super.key,
  });

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
            EditButton(context),
            DeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget EditButton(BuildContext context) {
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

  Widget DeleteButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        print('Delete a product');
      },
      icon: const Icon(Icons.delete),
      color: Theme.of(context).colorScheme.error,
    );
  }
}
