import 'package:ct484_project/ui/screens.dart';
import 'package:flutter/foundation.dart';
import '../../models/cart_item.dart';
import '../../models/product.dart';

class CartManager with ChangeNotifier {
  Map<String, CartItem> items = {
    'p1': CartItem(
      id: 'p1',
      name: 'Vegetarian Food 1',
      soluong: 3,
      gia: 8.2,
    ),
  };

  int get productCount {
    return items.length;
  }

  List<CartItem> get product {
    return items.values.toList();
  }

  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {...items}.entries;
  }

  double get totalAmount {
    var total = 0.0;
    items.forEach((key, value) {
      total += value.gia * value.soluong;
    });
    return total.toDouble();
  }
  void addItem(Product product) {
    if (items.containsKey(product.id)) {
      items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          soluong: existingCartItem.soluong + 1,
        ),
      );
    } else {
      items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          name: product.name,
          gia: product.price,
          soluong: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    if (!items.containsKey(productId)) {
      return;
    }

    if (items[productId]?.soluong as num > 1) {
      items.update(
        productId,
        (existingCartItem) => existingCartItem.copyWith(
          soluong: existingCartItem.soluong - 1,
        ),
      );
    } else {
      items.remove(productId);
    }
    notifyListeners();
  }

  void clearItem(String productId) {
    items.remove(productId);
    notifyListeners();
  }

  void clearAllItems() {
    items = {};
    notifyListeners();
  }
  void cancelOrder(String productId) {
    if (items.containsKey(productId)) {
      items.remove(productId);
      notifyListeners();
    }
  }
}
