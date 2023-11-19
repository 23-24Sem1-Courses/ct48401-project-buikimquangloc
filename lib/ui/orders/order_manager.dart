import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../models/cart_item.dart';
import '../../models/order_item.dart';

class OrderManager with ChangeNotifier {
  final List<OrderItem> orders = [
    OrderItem(
      id: 'a1',
      amount: 24.6,
      product: [
        CartItem(
          id: 'c1',
          name: 'Vegetarian Food 1',
          soluong: 3,
          gia: 8.2,
        )
      ],
      dateTime: DateTime.now(),
    ),
  ];

  int get orderCount {
    return orders.length;
  }

  List<OrderItem> get orders1 {
    return [...orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) async {
    orders.insert(
      0,
      OrderItem(
        id: 'o${DateTime.now().toIso8601String()}',
        amount: total,
        product: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
