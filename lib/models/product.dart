// miêu tả sản phẩm
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final ValueNotifier<bool> _isFavorite;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    isFavorite = false,
  }) : _isFavorite = ValueNotifier(isFavorite);

  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? _isFavorite,
    );
  }
}
