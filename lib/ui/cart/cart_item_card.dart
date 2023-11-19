import 'package:ct484_project/ui/cart/cart_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/dialog_utils.dart';
import '../../models/cart_item.dart';

class CartItemCard extends StatelessWidget {
  final String productid;
  final CartItem cartItem;

  const CartItemCard({
    required this.productid,
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          'Do you want to remove?',
        );
      },
      onDismissed: (direction) {
        context.read<CartManager>().clearItem(productid);
      },
      child: buildItemCart(),
    );
  }

  Widget buildItemCart() {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$${cartItem.gia}'),
              ),
            ),
          ),
          title: Text(cartItem.name),
          subtitle: Text('Total: \$${cartItem.gia * cartItem.soluong}'),
          trailing: Text('${cartItem.soluong}x'),
        ),
      ),
    );
  }
}
