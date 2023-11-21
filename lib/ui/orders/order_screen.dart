import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'order_manager.dart';
import 'order_item_cart.dart';
import '../shared/app_drawer.dart';
import 'package:logger/logger.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';
  final Logger _logger = Logger();

  OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _logger.d('building orders');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: Consumer<OrderManager>(
        builder: (ctx, ordersManager, child) {
          return ListView.builder(
            itemCount: ordersManager.orderCount,
            itemBuilder: (ctx, i) =>
            OrderItemCard(ordersManager.orders[i]),
          );
        },
      ),
    );
  }

}
