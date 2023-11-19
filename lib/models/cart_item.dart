class CartItem {
  final String id;
  final String name;
  final int soluong;
  final double gia;

  CartItem({
    required this.id,
    required this.name,
    required this.soluong,
    required this.gia,
  });

  CartItem copyWith({
    String? id,
    String? name,
    int? soluong,
    double? gia,
  }) {
    return CartItem(
      id: id ?? this.id, 
      name: name ?? this.name, 
      soluong: soluong ?? this.soluong, 
      gia: gia ?? this.gia,
    );
  }
}
