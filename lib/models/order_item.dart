import 'cart_item.dart';

class OrderItem {
  final String? id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;

  int get productCount {
    return product.length;
  }

  OrderItem({
    this.id,
    required this.amount,
    required this.product,
    DateTime? dateTime,
  }) : dateTime = dateTime ?? DateTime.now();

  OrderItem copyWith({
    String? id,
    double? amount,
    List<CartItem>? product,
    DateTime? dateTime,
  }) {
    return OrderItem(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      product: product ?? this.product,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
